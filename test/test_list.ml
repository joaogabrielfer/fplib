open Fplib.List

let () =
  let xs =
      Cons (1,
        Cons (2,
          Cons (3, Nil)))
  in

  assert (
    to_list xs
    = [1; 2; 3]
  );

  assert (
    to_list (reverse xs)
    = [3; 2; 1]
  );

  assert (
    to_list (map (( + ) 1) xs)
    = [2; 3; 4]
  )
