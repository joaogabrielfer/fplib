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

val of_list :
  'a list ->
  'a t

val to_list :
  'a t ->
  'a list

val fold_left :
  ('acc -> 'a -> 'acc) ->
  'acc ->
  'a t ->
  'acc

val fold_right :
  ('a -> 'acc -> 'acc) ->
  'a t ->
  'acc ->
  'acc

val reverse :
  'a t ->
  'a t
