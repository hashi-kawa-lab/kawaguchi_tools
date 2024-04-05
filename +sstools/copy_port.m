function sys = copy_port(sys, from, to)

sys = copy_input_port(sys, from, to);
sys = copy_output_port(sys, from, to);

end

