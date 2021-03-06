#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

staload "libats/libc/SATS/stdio.sats"


val ascii_bias = 0x30


fun next_sum (curr_num: int, next_num: int, sum: int): int =
    if curr_num = next_num then
        sum + next_num
    else
        sum


fun calc_captcha (fr: !FILEref): int =
    let val first_chr : int = fgetc(fr) - ascii_bias in
        let fun do_loop (fr : !FILEref, curr: int, sum: int) : int =
            let val next = fgetc(fr) - ascii_bias in
                if next >= 0 then
                    do_loop(fr, next, next_sum(curr, next, sum))
                else
                    next_sum(curr, first_chr, sum)
            end
        in
            do_loop(fr, first_chr, 0)
        end
    end


implement main0 (argc, argv) =
    let val input =
            if argc != 2 then
                "input.d01"
            else
                argv[1]
        //val fp = fopen_exn(argv[1], file_mode_r) // Constraint Error?
        val fp = fopen_exn(input, file_mode_r)
        val fr = FILEptr_refize(fp)
        val res = calc_captcha(fr)
        val _ = fclose0(fr)
    in
        print!(res, "\n")
    end
