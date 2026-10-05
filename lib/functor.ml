module type S = sig
  type 'a t

  val map : ('a -> 'b) -> 'a t -> 'b t
end

module Ops (F : S) = struct
  let replace x fa = F.map (fun _ -> x) fa
  let void fa = F.map (fun _ -> ()) fa
end
