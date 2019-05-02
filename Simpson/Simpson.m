function [I] = Simpson(x,y)
%Simpson Numerically integrates tabular data using Simpson's 1/3 Rule and
%Trapezoidal Method if necessary
%Inputs:  x - 
%         y - 
%Outputs: I - Numerical Integral

if length(x) ~= length(y)
    error('input vectors must be same length!')
end

%Checks for equal spacing
i=1;
while i < (length(x))
    spacel = x(i);
    spacer = x(i+1);
    %Finds difference between terms
    space(i) = spacer - spacel;
    i = i+1;
end
%Compares difference between terms
if space(1) ~= space(1:length(space))
    Error('Interval spacing is unequal!')
end

if rem(length(space),2) ~= 0
    warning('Trapezoidal method will be used to evaluate final interval due to odd number of intervals')
    space = space(1:(length(space)-1));
    tra = 1;
else
    tra = 0;
end

%%Simpson's 1/3 Rule

%Seperates indices to be multiplied by 4 and 2
i = 2;
n = 1;
while i < length(y)
    a(n) = y(i);
    i = i+2;
    n = n+1;
end
i = 3;
n = 1;
while i < length(y)-1
    b(n) = y(i);
    i = i+2;
    n = n+1;
end
%Calculates Integral

I = (space(1))*(y(1)+4*(sum(a))+2*(sum(b))+y(length(y)));
I = I/3;

if tra == 1
T = (space(1)*(y(length(y))+y(length(y)-1)))/2;
I = I+T;
end

end

