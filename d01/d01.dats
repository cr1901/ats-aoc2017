#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

staload "libats/libc/SATS/stdio.sats"

//#include ""

fun calc_captcha (fp: FILEptr0): int =
(
    (* let first_chr = fread(fp) in
        let fun do_loop (fp : FILEptr0, curr, sum: int) : int and
        val curr = fread(fp) and

        in
            do_loop() *)

    0
)


fun next_sum
    (prev_num: int, curr_num: int, sum: int): int =
(
    if prev_num = curr_num then
        sum + curr_num
    else
        sum
)

implement main0 (argc, argv) =
(
    if argc != 2 then
        print "Need to supply input file.\n"
    (* else let val fp = fopen(argv[0], "r") in
         calc_captcha(fp) *)
)
