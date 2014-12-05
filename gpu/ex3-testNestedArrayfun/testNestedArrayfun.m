function o1 = testNestedArrayfun
gpu = gpuDevice;
N = 2000;
S = 10;
g = gpuArray.rand(N)+3;
%%
tic
o1 = nWithGPUArray;
wait(gpu)
t1 = toc;
%%
tic
x = gpuArray.colon(1,N-S+1)';
y = gpuArray.colon(1,N-S+1);
o2 = bsxfun(@nWithArrayfun, x, y);
wait(gpu)
t2 = toc;
%%
fprintf('Speedup = %.2f, time with : gpuArray: %.2fs  arrayfun: %.2fs\n', t1/t2, t1, t2);
assert( isequal(o1, o2), 'Different values' );

    function s = nWithGPUArray
        s = gpuArray.zeros(N-S+1);
        for ii = 0:S-1
            for jj = 0:S-1
                s = s + sin(cos(g(ii+(1:N-S+1), jj+(1:N-S+1))));
            end
        end        
    end

    function s = nWithArrayfun(x, y)
        s = 0;
        for k = 0:S-1
            for l = 0:S-1
                s = s + sin(cos(g(x+k, y+l)));
            end
        end
    end

end