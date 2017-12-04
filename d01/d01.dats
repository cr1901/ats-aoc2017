#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"
//#include "libats/libc/DATS/stdio.dats"

//%{^
//#include "libats/libc/CATS/stdio.cats"
//%}

staload "libats/libc/SATS/stdio.sats"
staload "prelude/SATS/integer.sats"


//#include ""

fun calc_captcha (fr: !FILEref): int =
(
    let val first_chr : int = fgetc(fr)
        val _ = print!(first_chr)
    in
        0
    end
        (* let fun do_loop (fp : FILEptr0, curr, sum: int) : int and
        val curr = fread(fp) and

        in
            do_loop() *)
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
    else
        let val fp = fopen_exn(argv[0], file_mode_r)
            val fr = FILEptr_refize(fp)
            val _ = calc_captcha(fr)
            (* TODO: These do not work. Check the error codes and figure out why.
            val _ = fclose0(fp)
            val _ = fclose1(fp)
            *)
            val _ = fclose0(fr)
        in
            ()
        end
)
