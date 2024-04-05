function sys = remove_input_port(sys, name_port)

if iscell(name_port)
    for k = 1:numel(name_port)
        sys = remove_input_port(sys, name_port{k});
    end
else
    if isfield(sys.InputGroup, name_port)
        sys = fix_ss(sys);
        sys(:, name_port) = [];
    end
end

end

