function [out, varargout] = natsort(in, varargin)

varargout = cell(nargout-1, 1);
[out, varargout{:}] = tools.natsort.natsort(in, varargin{:});

end

