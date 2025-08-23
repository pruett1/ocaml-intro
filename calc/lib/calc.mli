class calc: object
    val queue: string Queue.t
    val mutable curr_val: float
    val mutable last_operation: string
    val mutable running: bool

    method input: unit

    method private infix_to_postfix: unit

    method print_queue: unit
    method private print_stack: unit

    method get_current: float

    method print_current: unit

    method is_running: bool

    method process_queue: unit
end