open Printf

module Mem : sig
  type 'r t =
    | Z : 'r -> 'r t
    | S : ('a -> 'r) t * 'a -> 'r t
  val apply : ('a -> 'b) t -> 'a -> 'b t
  val extract : 'a t -> 'a
end  = struct
  type 'r t =
    | Z : 'r -> 'r t
    | S : ('a -> 'r) t * 'a -> 'r t

  let make x = Z x
  let apply repr arg = S (repr, arg)
  let (//) = apply

  let hmap : (Obj.t, Obj.t) Lazy_trie.t = Lazy_trie.empty


  let extract : type a . a t -> a = fun root ->
    let rec helper : type a . Obj.t list -> a t -> a = fun path r ->
      match r with
      | Z f -> f
      | S (f, x) -> helper path f x
    in
    helper [] root

end


let foo = Mem.(S (Z List.fold_left, (fun x _ -> x)))
let foo2 = Mem.extract foo
let foo3 = Mem.extract foo 1 ["asdf"]

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
