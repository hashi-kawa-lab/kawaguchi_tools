function sys = copy_input_port(sys, from, to)

sys.InputGroup.(to) = sys.InputGroup.(from);
sys = fix_ss(sys);

end

