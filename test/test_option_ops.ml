open Fplib

module Option_functor_ops = Functor.Ops(Option)
module Option_applicative_ops = Applicative.Ops(Option)

let () =
    let option1 =
        Option.Some(10) in
    let option2 =
        Option.Some(20) in

    assert (
        Option_functor_ops.replace "x" option1
        =
        Option.Some("x")
        );

    assert (
        Option_functor_ops.void option1
        =
        Option.Some(())
    );

    assert (
        Option_applicative_ops.lift2 (+) option1 option2
        =
        Option.Some(30)
    );

    assert (
        Option_applicative_ops.product option1 option2
        =
        Option.Some((10, 20))
    );

    assert (
        Option_applicative_ops.keep_left option1 option2
        =
        Option.Some(10)
    )
