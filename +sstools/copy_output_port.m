function sys = copy_output_port(sys, from, to)

sys.OutputGroup.(to) = sys.OutputGroup.(from);
sys = fix_ss(sys);

end

