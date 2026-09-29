module type S = sig
    include Functor.S

    val pure : 'a -> 'a t

    val apply : ('a -> 'b) t -> 'a t -> 'b t
end


module Ops (A: S) = struct

    (* map_via_apply *)
    (* Type: (a -> b) -> F a -> F b *)
    (* Behavior: apply a normal function inside the applicative context. *)
    (* Conceptually: lift the function with pure, then apply it. *)
    (* Should behave identically to Functor.map. *)
    let map_via_apply f a =
        A.apply (A.pure f) a

    (* lift2 *)
    (* Type: (a -> b -> c) -> F a -> F b -> F c *)
    (* Behavior: lift a binary function into the applicative context. *)
    (* Examples: *)
    (* Option: lift2 (+) (Some 2) (Some 3) → Some 5 *)
    (* List: combines every value from both lists according to List's Applicative behavior. *)
    let lift2 op a b =
        A.apply (A.apply (A.pure op) a) b

    (* lift3 *)
    (* Type: (a -> b -> c -> d) -> F a -> F b -> F c -> F d *)
    (* Same idea as lift2, but for three arguments. *)
    (* Useful mainly to make the pattern obvious. *)
    let lift3 op a b c =
        A.apply (A.apply (A.apply (A.pure op) a) b) c

    (* product *)
    (* Type: F a -> F b -> F (a * b) *)
    (* Behavior: combine two independent applicative values into a pair. *)
    (* Example: *)
    (* Some 10 and Some "foo" → Some (10, "foo") *)
    (* For List, produces all combinations of pairs. *)
    let product a b =
        lift2 (fun a b -> (a, b)) a b

    (* keep_left *)
    (* Type: F a -> F b -> F a *)
    (* Run/combine both applicative contexts, but keep the value from the first. *)
    (* This corresponds roughly to Haskell's <*. *)
    let keep_left a b =
        lift2 (fun a _b -> a) a b

    (* keep_right *)
    (* Type: F a -> F b -> F b *)
    (* Run/combine both contexts, but keep the value from the second. *)
    (* Corresponds roughly to Haskell's *>. *)
    let keep_right a b =
        lift2 (fun _a b -> b) a b
end
