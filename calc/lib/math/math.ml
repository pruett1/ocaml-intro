let add x y = x +. y
let subtract x y = x -. y
let multiply x y = x *. y
let divide x y =
  if y <> 0.0 then x /. y
  else failwith "Division by zero"
let power x y = x ** y

let op_order op = 
  match op with
  | "^" -> 3
  | "/" | "*" -> 2
  | "+" | "-" -> 1
  | _ -> -1