let () = (
  print_endline "\nWelcome to this stateful calculator:\n";
  print_endline("Use the normal operators and use c to clear");
  print_endline "Type 'exit' at any time to quit.";

  let calc = new Calc.calc in
  while calc#is_running do
    calc#input;
    (* calc#infix_to_postfix; *)
    calc#process_queue;
    calc#print_current;
  done
)