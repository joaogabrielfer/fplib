module type S = sig
  include Applicative.S

  val empty : 'a t
  val alt : 'a t -> 'a t -> 'a t
end
