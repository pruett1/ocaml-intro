class calc = object (self)
  val queue = Queue.create()
  val stack = Stack.create()
  val mutable curr_val = 0.
  val mutable last_operation = "NaN"
  val mutable running = true

  method input = 
    let input = Input.get_input "> " in
    Input.process_input input queue

  method private infix_to_postfix = 
    let postfix = Queue.create() in
    let stack = Stack.create() in
    while not (Queue.is_empty queue) do
      let top = Queue.take queue in
      if Input.is_float top then Queue.add top postfix
      else if top = "(" then Stack.push "(" stack
      else if top = ")" then (
        while not (Stack.is_empty stack) && Stack.top stack <> "(" do
          Queue.add (Stack.pop stack) postfix
        done;
        if not (Stack.is_empty stack) then ignore (Stack.pop stack) (* discard the last "(" *)
      )
      else (
        while not (Stack.is_empty stack) && (Math.op_order top) <= (Math.op_order (Stack.top stack)) do
          Queue.add (Stack.pop stack) postfix
        done;
        Stack.push top stack
      )
    done;
    while not (Stack.is_empty stack) do
      Queue.add (Stack.pop stack) postfix
    done;
    Queue.iter (fun x -> Queue.add x queue) postfix

  method print_queue = 
    Queue.iter print_endline queue

  method get_current = curr_val

  method is_running = running

    method process_queue = 
      self#infix_to_postfix;
      let exit_found = ref false in
      while not (Queue.is_empty queue) && not !exit_found do
        let item = Queue.pop queue in
        if item = "exit" then (
          exit_found := true;
          running <- false
        )
        else if Input.is_float item then
          Stack.push (float_of_string item) stack
        else (
          let safe_pop () = 
            if Stack.is_empty stack then curr_val else Stack.pop stack
          in
          match item with
          | "+" -> (
            let a = safe_pop () in
            let b = safe_pop () in
            let r = Math.add a b in
            Stack.push r stack;
            curr_val <- r
          )
          | "-" -> (
            let a = safe_pop () in
            let b = safe_pop () in
            let r = Math.subtract a b in
            Stack.push r stack;
            curr_val <- r
          )
          | "*" -> (
            let a = safe_pop () in
            let b = safe_pop () in
            let r = Math.multiply a b in
            Stack.push r stack;
            curr_val <- r
          )
          | "/" -> (
            let a = safe_pop () in
            let b = safe_pop () in
            let r = Math.divide a b in
            Stack.push r stack;
            curr_val <- r
          )
          | "^" -> (
            let a = safe_pop () in
            let b = safe_pop () in
            let r = Math.power a b in
            Stack.push r stack;
            curr_val <- r
          )
          | "c" -> (
            Stack.clear stack;
            curr_val <- 0.
          )
          | _ -> print_endline "Unknown operator"
        )
      done;
      if not (Stack.is_empty stack) then curr_val <- Stack.top stack
end