#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

staload "libats/libc/SATS/stdio.sats"
staload "libats/ML/SATS/filebas.sats"


fun split_half (fr: !FILEref, halfway: lint) : (arrszref int, arrszref int) =
    let
        // How to make a char literal?
        val i_phase = arrszref_make_elt<int>(g0int2uint_lint_size(halfway), 0)
        val o_phase = arrszref_make_elt<int>(g0int2uint_lint_size(halfway), 0)

        // FIXME: Let's not do fgetc
        fun fill_buf(fr: !FILEref, arr: arrszref int) : void =
            let fun loop0(iter : lint) : void =
                if iter < halfway then
                    (
                        arr[iter] := fgetc(fr);
                        loop0(iter + 1L)
                    )
                else
                    ()
            in
                loop0(0L)
            end

        in
            (
                let val _ = fseek(fr, 0L, SEEK_SET) in
                    ()
                end;

                let val _ = fseek(fr, halfway, SEEK_SET) in
                    ()
                end;

                (i_phase, o_phase)
            )
    end



implement main0 (argc, argv) =
    let val input =
        if argc != 2 then
            "input.d01"
        else
            argv[1]
        val fp = fopen_exn(input, file_mode_r)
        val fr = FILEptr_refize(fp)
        val halfway = (
                        ignoret(fseek(fr, 0L, SEEK_END));
                        g0int2uint_lint_size((ftell(fr) - 1L)/2L)
                    )

    in
        println!("offset : ", halfway)
    end
