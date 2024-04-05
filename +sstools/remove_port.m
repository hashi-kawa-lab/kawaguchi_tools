function sys = remove_port(sys, name_port)

sys = remove_input_port(sys, name_port);
sys = remove_output_port(sys, name_port);

end

