let get_input prompt = 
  print_string prompt;
  read_line ()

let is_float s =
  try
    ignore (float_of_string s);
    true
  with Failure _ -> false

let process_input input queue = 
  let current_string = ref "" in
  String.iter (fun c ->
      if c = ' ' then (
        if !current_string <> "" then (
          Queue.add !current_string queue;
          current_string := ""
        )
      )
      else if (c = 'c' || c = '(' || c = ')') then (
        if !current_string <> "" then (
          Queue.add !current_string queue;
          Queue.add (String.make 1 c) queue;
          current_string := ""
        )
        else 
          Queue.add (String.make 1 c) queue
      )
      else if !current_string <> "" then (
        if is_float (String.make 1 c) <> is_float !current_string then (
          Queue.add !current_string queue;
          current_string := String.make 1 c
        )
        else (
          current_string := !current_string ^ (String.make 1 c)
        )
      )
      else (
        current_string := String.make 1 c
      )
    ) input;
    (*flush remaining string into queue*)
    if !current_string <> "" then Queue.add !current_string queue
