type 'a t =
  | Nil
  | Cons of 'a * 'a t

val empty : 'a t

val cons :
  'a -> 'a t -> 'a t

val map :
  ('a -> 'b) ->
  'a t ->
  'b t
