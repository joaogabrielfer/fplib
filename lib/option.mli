type 'a t =
  | Some of 'a
  | None

val map : ('a -> 'b) -> 'a t -> 'b t
val pure : 'a -> 'a t
val apply : ('a -> 'b) t -> 'a t -> 'b t
val empty : 'a t
val alt : 'a t -> 'a t -> 'a t
