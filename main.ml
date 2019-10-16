open Printf

external inspect : 'a -> 'a = "inspect_block" ;;

let f = fun x y z -> x+y+z
(* let g = let x = 1 and y = 2 in fun z -> x+y+z *)

let () =
  (* let _ = fun () -> printf "hello\n%!" in *)
  let _ = inspect [| 1; 2; 3 |] in
  let _ =  inspect f in
  (* let _ =  inspect g in *)
  (* ignore @@ inspect g; *)
  ()
