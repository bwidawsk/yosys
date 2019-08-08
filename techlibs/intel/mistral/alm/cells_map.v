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

module \$_DFF_P_ (input D, C, output Q); MISTRAL_FF _TECHMAP_REPLACE_(.D(D), .CLK(C), .AC(1'b0), .Q(Q)); endmodule
module \$_DFF_N_ (input D, C, output Q); MISTRAL_FF _TECHMAP_REPLACE_(.D(D), .CLK(~C), .AC(1'b0), .Q(Q)); endmodule

module \$_DFF_PP0_ (input D, C, R, output Q); MISTRAL_FF _TECHMAP_REPLACE_(.D(D), .CLK(C), .AC(R), .Q(Q)); endmodule
module \$_DFF_PP1_ (input D, C, R, output Q); MISTRAL_FF _TECHMAP_REPLACE_(.D(~D), .CLK(C), .AC(R), .Q(~Q)); endmodule
module \$_DFF_PN0_ (input D, C, R, output Q); MISTRAL_FF _TECHMAP_REPLACE_(.D(D), .CLK(C), .AC(~R), .Q(Q)); endmodule
module \$_DFF_PN1_ (input D, C, R, output Q); MISTRAL_FF _TECHMAP_REPLACE_(.D(~D), .CLK(C), .AC(~R), .Q(~Q)); endmodule
module \$_DFF_NP0_ (input D, C, R, output Q); MISTRAL_FF _TECHMAP_REPLACE_(.D(D), .CLK(~C), .AC(R), .Q(Q)); endmodule
module \$_DFF_NP1_ (input D, C, R, output Q); MISTRAL_FF _TECHMAP_REPLACE_(.D(~D), .CLK(~C), .AC(R), .Q(~Q)); endmodule
module \$_DFF_NN0_ (input D, C, R, output Q); MISTRAL_FF _TECHMAP_REPLACE_(.D(D), .CLK(~C), .AC(~R), .Q(Q)); endmodule
module \$_DFF_NN1_ (input D, C, R, output Q); MISTRAL_FF _TECHMAP_REPLACE_(.D(~D), .CLK(~C), .AC(~R), .Q(~Q)); endmodule
