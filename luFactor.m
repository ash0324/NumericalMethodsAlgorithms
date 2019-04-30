function [L,U,P] = luFactor(A)
%LUFACTOR - performs and LU factorization of a square matrix
    %Inputs: A - a square matrix
    %Outputs: L - lower triangular matrix
    %         U - Upper triangular matrix
    %         P - Pivot Matrix
% matrices are such that P*A = L*U

%check that input matrix is square
square = size(A);
if square(1) ~= square(2)
    error('Matrix must be square')
end
if square(1) ~= 1
    %Create identity matrix corresponding to size of inputted matrix
    P = eye(square);
    L = zeros(square);
    U = A;
    n = 1; m = 1; mrow = 0;
    iter = 1; pivot = 0;
    lcol = 1; oldlen = 1;
    while (n+1) <= square(1) && m < square(2)
        %Check to see if a pivot is necessary
        if pivot == 0 && n == m
            [val,ind] = max(abs(U((n:square(1)),m)));
            ind = ind+n-1;
            if abs(U(n,m)) ~= val
                %Perform Pivot
                U1 = U; U1(n,:) = U(ind,:); U1(ind,:) = U(n,:);
                P1 = P; P1(n,:) = P(ind,:); P1(ind,:) = P(n,:);
                if n > 1
                    pivot = 1;
                    row1 = n;
                    row2 = ind;
                end
                U = U1; P = P1;
            end
        end
        %Eliminate coefficient
        if U((n+1),m) ~= 0
            F = (U((n+1),m)/U((n-mrow),m));
            U((n+1),:) = ((U((n+1),:))-F*(U((n-mrow),:)));
        else
            F = 0;
        end
        %When a column of the U matrix is complete, Fill in that column in the
        %L matrix
        if m > lcol
            %Switches rows of L if pivot was performed
            L(m:square(1),lcol) = FArray(oldlen:(length(FArray)))';
            if pivot == 1
                L1 = L; L1(row1,:) = L(row2,:); L1(row2,:) = L(row1,:);
                L=L1;
                pivot = 0;
            end
            oldlen = length(FArray)+1;
            lcol=m;
        end
        %Store factors in array to later fill in L matrix
        FArray(1,iter) = F;
        
        n = n+1;
        iter = iter+1;
        mrow = mrow+1;
        %Once you complete a column, move to next column
        if n == (square(1))
            m = m+1;
            n = m;
            mrow = 0;
        end
    end
    
    %Complete final column of L Matrix
    oldlen = length(FArray);
    L(m:square(1),lcol) = FArray(oldlen:(length(FArray)))';
    L = L + eye(square);
else
    L = 1;
    U = A;
    P = 1;
end
end

