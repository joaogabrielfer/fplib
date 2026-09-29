open Fplib

let rec print_string_list xs =
    match xs with
    | List.Nil -> print_string ""
    | List.Cons (x, xs) -> print_string x; print_string_list xs

let list = List.cons "oi" (List.cons "tchau" List.Nil)
let list = List.map(fun s -> String.concat s [""; "!!!\n"]) list;;

print_string_list list
