open Fplib

let () =
  let v = Option.Some 10 in

  (* Identity *)
  assert (Option.apply (Option.pure Fun.id) v = v);

  (* Homomorphism *)
  let f x = x * 2 in
  let x = 10 in

  assert (Option.apply (Option.pure f) (Option.pure x) = Option.pure (f x));

  (* Interchange *)
  let u = Option.Some (fun x -> x + 5) in

  let y = 10 in

  assert (
    Option.apply u (Option.pure y) = Option.apply (Option.pure (fun f -> f y)) u);

  (* Composition *)
  let u = Option.Some (fun x -> x * 2) in

  let v = Option.Some (fun x -> x + 3) in

  let w = Option.Some 10 in

  let compose f g x = f (g x) in

  assert (
    Option.apply (Option.apply (Option.apply (Option.pure compose) u) v) w
    = Option.apply u (Option.apply v w))
