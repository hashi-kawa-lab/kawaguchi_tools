function sys = remove_output_port(sys, name_port)

if iscell(name_port)
    for k = 1:numel(name_port)
        sys = remove_output_port(sys, name_port{k});
    end
else
    if isfield(sys.OutputGroup, name_port)
        sys = fix_ss(sys);
        sys(name_port, :) = [];
    end
end

end

