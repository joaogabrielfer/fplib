type 'a t =
  | Nil
  | Cons of 'a * 'a t

let empty = Nil
let cons x xs = Cons (x, xs)

let rec map f xs =
  match xs with
  | Nil -> Nil
  | Cons (x, xs) -> Cons (f x, map f xs)

let rec of_list xs =
  match xs with
  | [] -> empty
  | x :: xs -> cons x (of_list xs)

let rec to_list xs =
  match xs with
  | Nil -> []
  | Cons (x, xs) -> x :: to_list xs

let rec fold_left f acc xs =
  match xs with
  | Nil -> acc
  | Cons (x, xs) -> fold_left f (f acc x) xs

let rec fold_right f xs acc =
  match xs with
  | Nil -> acc
  | Cons (x, xs) -> f x (fold_right f xs acc)

let reverse xs = fold_left (fun xs x -> cons x xs) Nil xs
let empty = Nil

let alt a b =
  match (a, b) with
  | Cons _, _ -> a
  | Nil, Cons _ -> b
  | _ -> Nil
