classdef local_logger < handle

    properties
        X;
        N=1000;
        n = 0;
        m = 0;
        dat = {}
        i = 0;
        degree
        str_degree
    end

    methods
        function obj = local_logger(N)
            if nargin == 1 && ~isempty(N)
                obj.N = N;
            end
            obj.n = 0;
            obj.X = [];
        end

        function add_data(obj, x)
            s = size(x);
            if obj.n == 0
                if s(1) == 1 || s(2) == 1
                    obj.X = zeros(numel(x), obj.N);
                    obj.degree = 1;
                else
                    ss = num2cell(s);
                    obj.degree = numel(ss);
                    obj.X = zeros(ss{:}, obj.N);
                end
                obj.str_degree = tools.arrayfun(@(i) ':', 1:obj.degree);
            elseif obj.i==size(obj.X,  obj.degree+1)
                %                tmp = obj.X;
                %                obj.X = zeros(size(obj.X,1)+obj.N, numel(x));
                %                obj.X(1:obj.n, :) = tmp;

                obj.m = obj.m + 1;
                obj.dat{obj.m} = obj.X;
                obj.X = zeros(size(obj.X));
                obj.i = 0;
            end

            if obj.degree == 1
                x = x(:);
                obj.X(:, obj.i+1) = x;
            else
                obj.X(obj.str_degree{:}, obj.i+1) = x;
            end
            obj.n = obj.n+1;
            obj.i = obj.i+1;
        end

        function d = get_log(obj, Start, End)

            out = cat(obj.degree+1, obj.dat{:}, obj.X);

            if nargin < 2 || isempty(Start)
                Start = 1;
            end
            if nargin < 3 || isempty(End)
                End = obj.n;
            end
            if Start > obj.n
                n_nan = End-Start+1;
            else
                n_nan = max(0, End-obj.n);
            end

            sz = num2cell(size(out));
            sz{end} =n_nan;
            d = cat(obj.degree+1, out(obj.str_degree{:}, Start:min(obj.n, End)), nan(sz{:}));
            if numel(size(d)) ~= obj.degree
                d = permute(d, [obj.degree+1, 1:obj.degree]);
            end
        end

    end

end

