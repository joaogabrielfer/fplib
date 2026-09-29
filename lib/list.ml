type 'a t =
  | Nil
  | Cons of 'a * 'a t

let empty =
  Nil

let cons x xs =
  Cons (x, xs)

let rec map f xs =
  match xs with
  | Nil -> Nil
  | Cons (x, xs) ->
      Cons (f x, map f xs)
