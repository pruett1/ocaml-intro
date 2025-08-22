class calc = object
  val queue = Queue.create()
  val mutable curr_val = 0.
  val mutable last_operation = "NaN"
  val mutable running = true

  method input = 
    let input = Input.get_input "> " in
    Input.process_input input queue

  method print_queue = 
    Queue.iter print_endline queue

  method get_current = curr_val

  method is_running = running

  method process_queue =
    let exit_found = ref false in
    while not (Queue.is_empty queue) && not !exit_found do
      let item = Queue.pop queue in
      if item = "exit" then (
        exit_found := true;
        running <- false;
      )
      else if (Input.is_float item && last_operation = "NaN") then curr_val <- float_of_string item
      else if (Input.is_float item && last_operation <> "NaN") then (
        let num = float_of_string item in
        match last_operation with
          | "+" -> curr_val <- Math.add curr_val num
          | "-" -> curr_val <- Math.subtract curr_val num
          | "*" -> curr_val <- Math.multiply curr_val num
          | "/" -> curr_val <- Math.divide curr_val num
          | "^" -> curr_val <- Math.power curr_val num
          | "sqrt" -> curr_val <- Math.sqrt curr_val
          | "c" -> curr_val <- num
          | _ -> print_endline "Unknown operation";
        last_operation <- "NaN"
      )
      else last_operation <- item;
    done
end