module type S = sig
  include Applicative.S

  val empty : 'a t
  val alt : 'a t -> 'a t -> 'a t
end

module Ops (A : S) = struct
  let optional a = Option.Some (A.alt a A.empty)

  let guard b =
    match b with
    | true -> A.pure ()
    | false -> A.empty

  let choice xs = List.fold_left A.alt A.empty xs
end
