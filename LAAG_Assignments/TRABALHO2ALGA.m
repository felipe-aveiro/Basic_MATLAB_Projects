diary output_result2
diary on
% ALGA (Linear Algebra and Analytical Geometry) - ASSIGNMENT 2  
clc;

% Exercise 1
%A matrix B, 6x4, is the matrix that contains the last 6 digits of both my student number, as well as of 3 other friends. 
format short
B = [2 1 8 7 8 6; 2 2 9 8 5 9; 2 3 2 2 9 7; 2 2 3 0 2 4]' 
%Column b contains the digits of the year I was born (2001).
b = [2 0 0 1]'
%The value of the integer c corresponds to the month in which I was born (december).
c = 12

%a)
%For A = B' B;
A = B' * B
%For C = B B';
C = B * B'

%b)
%The matrix rank of a given matrix is denoted by rnk_(M) and is equal to the amount of
%pivot positions that appear in the matrix after applying the Gaussian elimination algorithm.
rnk_A = rank(A)
rnk_B = rank(B)
rnk_C = rank(C)
%Therefore, it is concluded that the rank of the 3 matrices is the same and all equal to 4

%c)
%For x = (1, 2, -1, -2), the function f(x) = x' A x / 2 + b' x + c assumes the value defined
%by f(x);
x = [1 2 -1 -2]'
f_x = (x'*A*x)/2+(b'*x)+c

%d)
I = eye(4)
%The matrix D, 4x4, stems from the sum of matrix A with the identity matrix.
D = A + I
%i)
%For d equal to the determinant of matrix D;
d = det(D)
%ii)
%Matriz T corresponds to the adjoint matrix of matrix D;
T = adjoint(D)
%iii)
%According to Theorem 54 from the supporting material, the inverse of matrix
% D can be determined by dividing T by d, where T corresponds to the adjoint matrix
% of D and d is equal to the determinant of D, and we will denote it as invD.
invD = T/d

%e)
%According to Theorem 51 from the supporting material, the algebraic complement
%relative to the element A(i,j) is given by ((−1)^(i+j)) det(Aij), where Aij denotes
%the submatrix (n − 1) × (n − 1) of A that results after removing row i and column j.
%So, to calculate the algebraic complement of A relative to the element A(2,1), it is
%necessary to calculate the determinant of the matrix A21.
A21 = A;
%Removing the 2nd row;
A21(2,:) = []
%Removing the 1st column;
A21(:,1) = []
%With the determinant of matrix A21 denoted as det_A21;
det_A21 = det(A21)
%Hence, the algebraic complement of A relative to the element A(2,1) will be:
C_Alg_A21 = ((-1)^(2+1)) * det(A21)

% Exercise 2
%a)
[L,U,P] = lu(A)
%Therefore, A = P'LU, but since the matrix P is orthogonal, this equality can be rewritten as PA = LU.

%b)
%Column c corresponds to the solution to the equation system Ly = Pb;
c = L\P*b
%Column xc corresponds to the solution to the linear equation system Ux = c;
xc = U\c

%c)
%Let's calculate the norm of b - Axc and verify if it is null;
norm_1 = norm(b - A*xc)
%Therefore, it is verified that the norm of this vector is not null.

% Exercise 3
%Column b is the last column of matrix A;
b = A(:,4)
%Removing the last column of A;
A(:,4) = []

%a)
%Performing the QR decomposition of the new matrix A yields;
[Q,R] = qr(A)

%b)
%The orthogonal projection of b onto the column space of the new matrix A,
%denoted as bs, can be calculated by the expression bs = Axo, where xo represents
%any solution of the linear equation system A'Axo = A'b.
xo = A'*A\A'*b
bs = A*xo

%c)
%The solution xo calculated in the previous step for the linear equation system
%A'Axo = A'b constitutes a least squares solution to Ax = b;
xo

% Exercise 4
%Adding column bs to the matrix A;
A(:,4) = bs

%a)
%Matrix C is obtained by the expression C = (A + A')/2;
C = (A + A')/2
%Calculatinhg the norm of C - C', we obtain;
norm_2 = norm(C - C')
%Since the norm of C - C' is zero, as verified, it is concluded that the matrix
%C - C' is a zero matrix of dimension 4x4, because the norm of a vector (matrix)
%will only be zero if it is a zero vector (matrix), that is, C = C', then matrix C is a symmetric matrix.

%b)
%Performing the factorization C = QDQ', we obtain two other matrices,
%where D denotes a diagonal matrix and Q an orthogonal matrix;
[Q,D] = eig(C)
%In order to verify, the test matrix T must then coincide with matrix C.;
T = Q*D*Q'
%Since T = C, then Q and D are the new matrices obtained by the factorization C = QDQ'.
diary off