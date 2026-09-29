open Fplib

module List_ops = Functor.Ops(List)

let () =
    let list =
        List.of_list [1; 2; 3]
    in

    assert (
        List_ops.replace "x" list
        =
        List.Cons(
            "x", List.Cons(
                "x", List.Cons(
                    "x", List.Nil)
                )
            )
        );

    assert (
        List_ops.void list |> List.to_list
        =
        [(); (); ()]
    )
