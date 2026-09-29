open Fplib

let () =
    let list =
        List.of_list [1; 2; 3; 4]
    in
    let f x = x * 2 in
    let g x = x + 1 in

    (* identity law *)
    assert(
        List.map Fun.id list |> List.to_list
        =
        [1; 2; 3; 4]
    );

    (* composition law *)
    assert(
        List.map f (List.map g list)
        =
        List.map (Fun.compose f g) list
    )
