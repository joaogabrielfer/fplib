type 'a t =
    | Some of 'a
    | None

val map :
  ('a -> 'b) ->
  'a t ->
  'b t
