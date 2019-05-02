function [root,fx,ea,iter] = falsePosition(func,x_l,x_u,es,maxiter)
%FALSEPOSITION estimates the root of a given function
%inputs: func: function of which to find zeros
%        x_l: lower bracket
%        x_u: upper bracket
%        es: desired relative error (defaults to 0.000001)
%        maxiter: the maximum iteration desired (defaults to 200)

if sign(func(x_l)) == sign(func(x_u))
    error('Bounds must bracket a root!')
end

switch nargin
    case 4
    maxiter = 200;
    case 3
    maxiter = 200;
    es = 0.000001;
    case 2
    error('not enough input arguments')
end

iter = 1;
if (x_u-x_l) ~= 0
    x_ro = (x_u-x_l);
else
    x_ro = 1
end
ea = 1;

while iter < maxiter && ea >= es
x_r = x_u-(func(x_u)*(x_l-x_u))/(func(x_l)-func(x_u));
    if sign(func(x_r)) == sign(func(x_l))
        x_l = x_r;
    elseif sign(func(x_r)) == sign(func(x_u))
        x_u = x_r;
    else
        break
    end
ea = abs((x_ro-x_r)/x_ro);
x_ro = x_r;
iter = iter+1;
end
root = x_r;
fx = func(root);
end
