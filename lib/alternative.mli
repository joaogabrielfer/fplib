module type S = sig
  include Applicative.S

  val empty : 'a t
  val alt : 'a t -> 'a t -> 'a t
end

open Fplib

module Ops (A : S) : sig
  val optional : 'a A.t -> 'a Option.t A.t
  val guard : bool -> unit A.t
  val choice : 'a List.t A.t -> 'a A.t
end
