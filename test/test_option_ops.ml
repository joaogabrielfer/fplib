open Fplib

module Option_functor_ops = Functor.Ops(Option)
module Option_applicative_ops = Applicative.Ops(Option)

let () =
    let option1 = Option.Some 10 in
    let option2 = Option.Some 20 in
    let option3 = Option.Some 3 in

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
    );
    (* keep_right *)
    assert (
    Option_applicative_ops.keep_right option1 option2
    =
    Option.Some 20
    );

    assert (
    Option_applicative_ops.keep_right Option.None option2
    =
    Option.None
    );

    assert (
    Option_applicative_ops.keep_right option1 Option.None
    =
    Option.None
    );

    (* lift3 *)
    assert (
    Option_applicative_ops.lift3
      (fun x y z -> x + y + z)
      option1
      option2
      option3
    =
    Option.Some 33
    );

    assert (
    Option_applicative_ops.lift3
      (fun x y z -> x + y + z)
      option1
      Option.None
      option3
    =
    Option.None
    );

    (* map_via_apply *)
    assert (
    Option_applicative_ops.map_via_apply
      (fun x -> x * 2)
      option1
    =
    Option.Some 20
    );

    assert (
    Option_applicative_ops.map_via_apply
      (fun x -> x * 2)
      Option.None
    =
    Option.None
    );

    (* map_via_apply should behave like Option.map *)
    assert (
    Option_applicative_ops.map_via_apply
      (fun x -> x + 5)
      option1
    =
    Option.map
      (fun x -> x + 5)
      option1
    )
