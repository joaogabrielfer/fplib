module type S = sig
  type 'a t

  val map : ('a -> 'b) -> 'a t -> 'b t
end

module Ops (F : S) : sig
  val replace : 'b -> 'a F.t -> 'b F.t
  val void : 'a F.t -> unit F.t
end
