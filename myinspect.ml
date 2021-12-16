external inspect : 'a -> 'a = "inspect_block" ;;

let f3 = fun x y z -> x+y+z
let f2 = fun x y -> x+y
let f1 = fun x  -> x
(* let g = let x = 1 and y = 2 in fun z -> x+y+z *)

let g x =
  let y=27 in
  fun z -> z+x+y ;;
let a1 = g 10

let h x y =
  let u=27 in
  fun z -> z+x+u+y ;;
let b1 = h 33
let b2 = h 3 4

(* let () = print_int 500 *)

[@@@ocaml.warning "-5"]

let () =
  (* let _ = fun () -> printf "hello\n%!" in *)
  (* let _ = inspect [| 1; 2; 3 |] in *)
  let _ =  inspect g in
  let _ =  inspect a1 in
  let _ =  inspect (g 11) in
  print_newline();
  let _ =  inspect h in
  let _ =  inspect b1 in
  (* let _ =  inspect b2 in *)

  (* let _ =  inspect f3 in *)
  (* let _ =  inspect g in *)
  (* ignore @@ inspect g; *)
  ()
