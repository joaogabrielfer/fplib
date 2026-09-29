type 'a t =
    | Some of 'a
    | None

let map f m =
    match m with
    | None -> None
    | Some (x) -> Some (f x)

let pure a =
    Some a

let apply f a =
    match f, a with
    | Some (f), Some (a) -> Some(f a)
    | _, _ -> None
