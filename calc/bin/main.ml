let () = (
  print_endline "Welcome to the Calculator:";
  print_endline "Type 'exit' at any time to quit.";

  let calc = new Calc.calc in
  while calc#is_running do
    calc#input;
    (* calc#print_queue; *)
    calc#process_queue;
    Printf.printf "Final value: %f\n" calc#get_current
  done
)