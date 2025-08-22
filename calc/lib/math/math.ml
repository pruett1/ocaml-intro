let add x y = x +. y
let subtract x y = x -. y
let multiply x y = x *. y
let divide x y =
  if y <> 0.0 then x /. y
  else failwith "Division by zero"
let power x y = x ** y
let sqrt x = x ** 0.5