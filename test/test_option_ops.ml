open Fplib

module Option_ops = Functor.Ops(Option)

let () =
    let option =
        Option.Some(10)
    in

    assert (
        Option_ops.replace "x" option
        =
        Option.Some("x")
        );

    assert (
        Option_ops.void option
        =
        Option.Some(())
    )
