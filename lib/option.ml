type 'a t =
    | Some of 'a
    | None

let map f m =
    match m with
    | None -> None
    | Some (x) -> Some (f x)
