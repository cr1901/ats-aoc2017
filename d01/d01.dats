#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"
//#include "libats/libc/DATS/stdio.dats"

//%{^
//#include "libats/libc/CATS/stdio.cats"
//%}

staload "libats/libc/SATS/stdio.sats"
staload "prelude/SATS/integer.sats"


//#include ""

fun next_sum
    (curr_num: int, next_num: int, sum: int): int =
(
    if curr_num = next_num then
        sum + next_num
    else
        sum
)


fun calc_captcha (fr: !FILEref): int =
(
    let val first_chr : int = fgetc(fr)
        //val _ = print!(first_chr, "\n")
    in
        let fun do_loop (fr : !FILEref, curr: int, sum: int) : int =
            let val next = fgetc(fr)
            in
                if next >= 0 then
                    (
                        //print!(next, "\n");
                        do_loop(fr, next, next_sum(curr, next, sum))
                    )
                else
                    next_sum(curr, first_chr, sum)
            end
        in
            do_loop(fr, first_chr, 0)
        end
    end
)


implement main0 (argc, argv) =
(
    if argc != 2 then
        print "Need to supply input file.\n"
    else
        let val fp = fopen_exn(argv[1], file_mode_r)
            val fr = FILEptr_refize(fp)
            val res = calc_captcha(fr)
            (* TODO: These do not work. Check the error codes and figure out why.
            val _ = fclose0(fp)
            val _ = fclose1(fp)
            *)
            val _ = fclose0(fr)
        in
            (
                print!(res, "\n")
            )
        end
)
