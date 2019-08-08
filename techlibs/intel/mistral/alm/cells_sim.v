/*
 *  yosys -- Yosys Open SYnthesis Suite
 *
 *  Copyright (C) 2019  Dan Ravensloft <dan.ravensloft@gmail.com>
 *
 *  Permission to use, copy, modify, and/or distribute this software for any
 *  purpose with or without fee is hereby granted, provided that the above
 *  copyright notice and this permission notice appear in all copies.
 *
 *  THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 *  WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 *  MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 *  ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 *  WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 *  ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 *  OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 *
 */

/*
 * A flip flop from an ALM has async and sync clrs, a synchronous load, and
 * initialized value. The current implementation is not complete.
 *
 * TODO: Handle syncload, aclr[1] and sclr signals.
 */
module MISTRAL_ALM_FF(input D, CLK, AC, output reg Q);
always @(posedge CLK or posedge AC)
    if (AC)
        Q <= 0;
    else
        Q <= D;
endmodule

/*
 * A standard ALM looks like a LUT6 with 2 adders, and 4 registers. This can
 * synthetically be made up of 4 LUT4s with 3 2-to-1 muxes. In fact, internally,
 * it is made up of 2 LUT4s, and 4 LUT3s with many many variably sized
 * muxes. It will either be mapped to cyclonev_lcell_comb if using VQM,
 * or be handled at a later point if not using VQM.
 */

module MISTRAL_ALM_LUT4 #(parameter [15:0] LUT = 16'h0000)
		     (input A, B, C, D, output Q);
wire [7:0] s3 = D ? LUT[15:8] : LUT[7:0];
wire [3:0] s2 = C ? s3[7:4] : s3[3:0];
wire [1:0] s1 = B ? s2[3:2] : s2[1:0];
assign Q = A ? s1[1] : s1[0];
endmodule

module MISTRAL_ALM_MUX2(input A, B, S, output Q);
assign Q = S ? B : A;
endmodule

module MISTRAL_ALM_ADDER_CARRY(input A, B, C, D, Cin, output S, T, Cout);
wire carry;
assign {carry, S} = A + B + Cin;
assign {Cout, T} = C + D + carry;
endmodule
