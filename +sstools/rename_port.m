function sys = rename_port(sys, from, to)

sys = rename_input_port(sys, from, to);
sys = rename_output_port(sys, from, to);

end