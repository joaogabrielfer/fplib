module type S = sig
  include Functor.S

  val pure : 'a -> 'a t
  val apply : ('a -> 'b) t -> 'a t -> 'b t
end

module Ops (A : S) : sig
  val map_via_apply : ('a -> 'b) -> 'a A.t -> 'b A.t
  val lift2 : ('a -> 'b -> 'c) -> 'a A.t -> 'b A.t -> 'c A.t
  val lift3 : ('a -> 'b -> 'c -> 'd) -> 'a A.t -> 'b A.t -> 'c A.t -> 'd A.t
  val product : 'a A.t -> 'b A.t -> ('a * 'b) A.t
  val keep_left : 'a A.t -> 'b A.t -> 'a A.t
  val keep_right : 'a A.t -> 'b A.t -> 'b A.t
end
