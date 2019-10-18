open Printf

module Mem (*: sig
  val apply : ('a -> 'b) -> 'a -> 'b
end *) = struct
  type ('r) t =
    | Z : 'r -> 'r t
    | S : ('a -> 'r) t * 'a -> 'r t

  let make x = Z x
  let apply repr arg = S (repr, arg)
  let (//) = apply
end

(*
external inspect : 'a -> 'a = "inspect_block" ;;

let f3 = fun x y z -> x+y+z
let f2 = fun x y -> x+y
let f1 = fun x  -> x
(* let g = let x = 1 and y = 2 in fun z -> x+y+z *)

let g x = let y=2 in fun z -> x+y+z ;;
let a1 = g 1

let () =
  (* let _ = fun () -> printf "hello\n%!" in *)
  (* let _ = inspect [| 1; 2; 3 |] in *)
  (* let _ =  inspect f1 in *)
  let _ =  inspect a1 in
  (* let _ =  inspect f3 in *)
  (* let _ =  inspect g in *)
  (* ignore @@ inspect g; *)
  ()
*)

let foo = Mem.(S (Z List.fold_left, (fun x _ -> x))) ;;
