
The directories here contain code associated with "Mathematical
Methods and Algorithms for Signal Processing" by Todd K. Moon and Wynn
C. Stirling.

DISCLAIMER:
We make no warranty, express or implied, that the programs or
algorithms presented in this book (or its accompanying media) are free
of error, or that they will meet your requirements for any particular
applications.  They should not be relied upon for solving a problem
whose incorrect solution could result in injury to a person or loss of
property.  Any and all use of the programs and algorithms associated
with this book is at your own risk.  The authors and publisher
disclaim all liability for direct or consequential damages resulting
from your use of the programs.

These m-files are user-contributed routines, and are not a product of
The MathWorks, Inc.  The MathWorks assume no responsibility for any
errors that may exist in these routines.


USAGE:
You are free to use the programs or any derivative of them for any
scientific purpose, but please reference this book. 

COPYRIGHT:
Programs and data in these directories are Copyright (C) 1999 by Todd
K. Moon, unless otherwise indicated in the program file or appropriate
readme file.

VERSION:
The code listed here has been written with Matlab v. 5 or above.
(Most of the algorithms will run with v. 4, but in some cases we make
use of 'end', cell arrays, and other version 5 features.


DIRECTORIES:
bookalgs -- contains the algorithms listed or referenced in the book,
   as well as function which these reference

mkpict -- contains functions and Matlabs scripts that are used to make the
   Matlab-based plots appearing in the book.  These are provided for
   researchers who want to profit from the form of a plot for their
   own work, and who want to test the result.

   Correspondance between the figures and the Matlab files is provided
   by the file mkpict/listoffigures.

   Many of these functions and scripts are were used as the basis for
   testing the algorithms referenced in the book, and in that regard
   should be regarded as part of the testing suite.

testers -- contains functions and scripts to test the algorithms
   appearing in the book, other than those that appear in the mkpict
   directory.  These can be used as examples of calling sequences.

solutions -- most (but not all) homework problems requiring Matlab
   code to be written have code provided here.  DON'T CHEAT yourself
   by rushing to the solution.  Learn to do it yourself!

misc -- is a treasure trove of functions which were written more or
   less in parallel with the book.  Some categories of functions:
   number theoretical methods: including fast convolution, CRT for 
     integers and polynomials, Euclidean algorithm, polynomial operations,
     linear congruences, and many others.
   interpolation and approximation: including Bernstein polynomials, Neville's
      algorithm, splines, rational approximation, remez (minimax), Vandermonde matrix
      equation solver, trigonometric interpolation, pade
      approximaation, etc.
   examples related to the book: including neural networks, Viterbi,
      Pisarenko, Prony, composite mappings, HMM training (with
      unscaled forward/backward probabilities), etc.

   The source of many of these is a part of the book --- which was removed
   due to lack of space --- about-number theoretical methods in signal
   processing, and another part --- also removed --- on interpolation
   and approximation.

data -- example data used in the blind source separation; the image
   for tomographic reconstruction; wavelet and scaling function data
   for plots.


TOOLBOXES:
The code written should run with Matlab without additional toolboxes,
with the following known exceptions:

bookalgs/eigmakePQ.m requires the use of the sinc function (found in
       the signal processing toolbox)

bookalgs/testirwls.m makes use of the freqz function for plotting (found in
       the signal processing toolbox)

misc/kaisfilt.m requires the use of the sinc and the frequz function (found in
       the signal processing toolbox)

misc/ratintfilt.m makes use of the zplane function for plotting (found in
       the signal processing toolbox)

mkpict/testeigfil.m and mkpict/testeigfil2.m use the freqz function
       for plotting (found in the signal processing toolbox)

testers/bliter.m requires the use of the sinc function (found in
       the signal processing toolbox)

testers/lpfilttest.m makes use of the freqz function for plotting (found in
       the signal processing toolbox)

testers/testbplp.m makes use of the freqz function for plotting (found in
       the signal processing toolbox)




***************************************************************
Directory: bookalgs
***************************************************************
art1.m
% 
% Produce an updated solution x to Ax = b using the algebraic reconstruction
% technique.
% (This function is for demonstration, and does not precompute
% row norms as a more efficient version would.)  No constraints are applied.
%
% function x = art1(A,x,b)
%
% A = input matrix
% x = initial solution
% b = right-hand side
% 
% Output x= updated solution


bayes3.m
% Minimax decision for Gaussian


bidiag.m
% 
% bidiagonalize the real symmetric matrix A: UAV' = B,
% 
% function [B,U,V] = bidiag(A)
%
% A = matrix to be factored
%
% B = bidiagonal
% U = orthogonal transformation (optional output)
% V = orthogonal transformation (optional output)


bliter1.m
% Iterate on bandlimited data using two projections


bss1.m
% Blind source separation example


bssg.m
%
% The nonlinear function in the neural network
%
% function y = bssg(v).  


cholesky.m
%
% Compute the Cholesky factorization of B, B = LL'
% (this version does not require additional storage)
%
% function [L] = cholesky(B)
%
% B = matrix to be factored
%
% L = lower triangular factor


compmap2.m
% Run the composite mapping algorithm to make a positive sequence


conjgrad1.m
% function [x,D] = conjgrad1(Q,b)
%
% Solve the equation Qx = b using conjugate gradient, where Q is symmetric
%
% Q = symmetric matrix
% b = right-hand side


conjgrad2.m
%
% Apply the conjugate gradient to minimize a function
%
% function [x,X] = conjgrad2(x,grad,hess)
%
% x = starting point
% grad = the gradient of the function to minimize (a function name)
% hess = the gradient of the function to minimize (a function name)
%
% Output x = update of point
% X = array of points examined (optional)


convnorm.m
%
% Compute the Hamming distance between the branchweights and the input
% This function may be feval'ed for use with the Viterbi algorithm
% (state and nextstate are not used here)
% 
% function d = convnorm(branch,input,state,nextstate)
% 


dijkstra.m
% 
% Find the set of shortest paths from vertex a to each of the other vertices
% in the graph represented by the cost matrix.
% If there is no branch from i to j, then cost(i,j) = inf.
%
% function [dist,prevnode] = dijkstra(a,cost)
% 
% a = starting vectex
% cost = cost matrix for graph
%
% dist(i) = shortest distance from vertex a to vertex i.
% prevnode(i) = vertex prior to vertex i on the shortest path to i.


dirtorefl.m
% 
% Convert from direct-form FIR filter coefficients in a
% to lattice form
%
% function kappa = refltodir(a)
%
% a = direct form coefficients
%
% kapp = lattice form coefficients


durbin.m
% 
% solve the nxn Toeplitz system Tx = [r(1)..r(n)]
% given a vector r = (r_0,r_1,\ldots,r_{n+1}),
%
% Since matlab has no zero-based indexing, r(1) = r_0
%
% function [x] = durbin(r)
%
% r = input vector
% x = solution to Tx = r


eigfil.m
%
% Design an eigenfilter
% 
% function h = eigfil(wp,ws,m,alpha)
%
% wp = passband frequency
% ws = stopband frequency
% m = number of coefficients (must be ODD)
% alpha = tradeoff parameter between stopband and passband
%
% h = filter coefficients


eigfilcon.m
%
% Design an eigenfilter with values constrained at some frequencies
%
% function h = eigfilcon(wp,ws,N,alpha, Wo, d)
%
% wp = passband frequency
% ws = stopband frequency
% m = number of coefficients (must be ODD)
% alpha = tradeoff parameter between stopband and passband
% Wo = list of constraint frequencies
% d = desired magnitude values at those frequencies
%
% h = filter coefficients


eigmakePQ.m
%
% Make the P and Q matrices for eigenfiltering
%
% function [P,Q] = eigmakePQ(wp,ws,N)
%
% wp = passband frequency
% ws = stopband frequency
% N = number of coefficients


eigqrshiftstep.m
% 
% Perform the implicit QR shift on T, where the shift
% is obtained by the eigenvalue of the lower-right 2x2 submatrix of T
%
% function [T,Q] = eigqrshiftstep(T,Qin)
% 
% T = tridiagonal matrix
% Qin = (optional) orthogonal input matrix
%
% T = T matrix after QR shift
% Q = (optional) orthogonal matrix


em1.m
% Illustration of example em algorithm computations
%


esprit.m
%
% Compute the frequency parameters using the ESPRIT method
%
%function f = esprit(Ryy,Ryz,p)
%
%
% Ryy = (estimate of) the autocorrelation of the observations
% Ryz = (estimate of) the correlation between y[n] and y[n+1]
% p = number of modes
%
% f = vector of frequencies (in Hz/sample)


et1.m
% et1.m
% Perform tomographic reconstruction using the EM algorithm
% im is a (nr x nc) image scaled so that 0=white, 255=black
% nr = number of rows;   nc = number of columns


fblp.m
%
% Forward-backward linear predictor
%
% function [a,sigma] = fblp(x,n)
%
% Given a sequence of data in the columns vector x, 
% return the coefficients of an nth order forward-backward linear predictor in a
%
% x = data sequence
% n = length of filter
%
% a = filter coefficients
% sigma = standard deviation of noise


fordyn.m
%
% Do forward dynamic programing
%
% function [pathlist,cost] = fordyn(G,W)
%
% G = list of next vertices
% W = list of costs to next vertices
%
% pathlist = list of paths through graphs
% cost = cost of the paths


gamble.m
%
% Return the bets for a race with win probabilities p and subfair odds o,
%
% function [b0,B] = gamble(p,o)
%
% p = probability of win
% o = subfair odds


gaussseid.m
% 
% Produce an updated solution x to Ax = b using Gauss-Seidel iteration
%
% function x = gausseid(A,x,b)
%
% A = input matrix
% x = initial solution
% b = right-hand side
% 
% Output x= updated solution


golubkahanstep.m
% 
% Given a bidiagonal matrix B with NO zeros on the diagonal or
% superdiagonal, create a new B <-- U'BV, using an implicit QR shift on
% T = B'B
%
% function [B,U,V] = golubkahanstep(B,Uin,Vin)
%
% B = bidiagonal matrix
% Uin, Vin = last estimate of U and V
%
% B = new bidiagonal matrix
% U, V = new estimate of U and V


gramschmidt1.m
% 
% Compute the Gram-Schmidt orthogonalization of the 
% columns of A, assuming nonzero columns of A
%
% function [Q,R] = gramschmidt1(A)
%
% A = input matrix to be factored (assuming nonzero columns)
%
% Q = orthogonal matrix
% R = upper triangular matrix such that A = QR


hmmApiupn.m
% 
% update the HMM probabilities A and pi using the normalized forward and
% backward probabilities alphahat and betahat
%
% function [A,pi] = hmmapiupn(y,alphahat,betahat,HMM)
%
% y = input sequence
% alphahat = normalized alphas
% betahat = normalized betas
% HMM = current model parameters
%
% A = updated transition probability matrix
% pi = updated initial probability matrix


hmmabn.m
% 
% compute the normalized forward and backward probabilities for the model HMM
% and the output probabilities and the normalization factor
%
% function [alphahat,betahat,f,c] = hmmabn(y,HMM)
%
% y = input sequence y[1],y[2], ..., y[T]
% HMM = HMM data
%
% alphahat = [ alphahat(:,1) alphahat(:,2) ... alphahat(:,T)]
%            (alphahat(:,t) = alphahat(y_t^T,:))
% betahat = [betahat(:,2) ... betahat(:,T-1) betahat(:,T) betahat(:,T+1)]
%            (betahat(:,t) = betahat(y_{t+1}^T|:))
% f = initial probability types
% c = normalizing factors


hmmdiscf.m
%
% Compute the pmf value for a discrete distribution
%
% function f = hmmdiscf(f)
% 
% y = output value
% f = output distribution
% s = state


hmmdiscfupn.m
% 
% Update the discrete HMM output distribution f using the normalized forward
% and backward probabilities alphahat and betahat
% 
% function f = hmmdiscfupn(y,alphahat,betahat,c,HMM)
%
% y = output sequence
% alphahat = normalized alphas
% betahat = normalized betas
% c = normalization constants
% HMM = current model parameters
%
% f = updated output distribution


hmmf.m
% 
% Determine the likelihood of the output y for the model HMM
% This function acts as a clearinghouse for different probability types
%
% function p = hmmf(y,f,s)
%
% y = output value
% f = probability distribution
% s = state
%
% p = likelihood


hmmfupdaten.m
% 
% Provide an update to the state output distributions for the HMM model
% using the normalized probabilities alphahat and betahat
%
% function f = hmmfupdaten(y,alphahat,betahat,HMM)
%
% y = output sequence
% alphahat = normalized alphas
% betahat = normalized betas
% c = normalization factors
% HMM = current model paramters
%
% f = updated output distribution


hmmgausf.m
% 
% Compute the pmf value for a Gaussian distribution
%
% function f = hmmgausf(y,f,s)
%
% y = output value
% f = output distribution
% s = state


hmmgausfupn.m
% 
% Update the Gaussian output distribution f of the HMM using the normalized
% probabilities alphahat and betahat
%
% function f = hmmgausfupn(y,alphahat,betahat,c,HMM)
%
% y = output sequence
% alphahat = normalized alphas
% betahat = normalized betas
% c = normalization constants
% HMM = current model parameters
%
% f = updated output distribution


hmmgendat.m
% 
% Generate T outputs of a Hidden Markov model HMM
%
% function [y,ss] = hmmgendat(T,HMM)
%
% T = number of samples to produce
% HMM = HMM model parameters
%
% y = output sequence
% s = (optional) state sequence


hmmgendisc.m
% 
% Generate T outputs of a HMM with a discrete output distribution
%
% function y = hmmgendisc(T,HMM)
% 
% T = number of outputs to produce
% HMM = model parameters
%
% y = output sequence
% ss = (optional) state sequence (for testing purposes)


hmmgengaus.m
% 
% Generate T outputs of a HMM with a Gaussian output distribution
%
% function y = hmmgengaus(T,HMM)
%
% T = number of outputs to produce
% HMM = model parameters
%
% y = output sequence
% ss = (optional) state sequence (for testing purposes)


hmminitvit.m
% 
% Initialize the Viterbi algorithm stuff for HMM sequence identification
%
% function hmminitvit(inHMM,inpathlen)
% 
% inHMM = a structure containing the initial probabilities, state transition
%         probabilities, and output probabilities
% inpathlen = length of window used in VA


hmmlpyseqn.m
%
% Find the log likelihood of the sequence y[1],y[2],...,y[T],
% using the parameters in HMM.% That is, compute log P(y|HMM),
%
% function lpy = hmmlpyseqn(y,HMM)
%
% y = input sequence = y[1],y[2],\ldots,y[T]
% HMM = current estimate of HMM parameters
%
% lpy = log P(y|HMM)


hmmlpyseqv.m
% 
% Find the log likelihood of the sequence y[1],y[2],...,y[T]
% i.e., compute log P(y|HMM),
% using the the Viterbi algorithm
%
% function lpy = hmmlpyseqv(y,HMM)
%
% y = input sequence
% HMM = HMM parameters
%
% lpy = log likelihood value


hmmnorm.m
% 
% Compute the branch norm for the HMM using the Viterbi approach
%
% function d = hmmnorm(branchweight,y,state,nextstate)
%
% branchweight= log transition probability 
% y = output
% state = current state in trellis
% nextstate = next state in trellis
%
% d = branch norm (log-likelihood)


hmmnotes.m
% Notes on data structures and functions for the HMM
% 


hmmtest2vb.m
% Test the HMM using both Viterbi and EM-algorithm based training methods


hmmupdaten.m
%
% Compute updated HMM model from observations
%
% function HMM = hmmupdaten(y,HMM) 
%
% y = output sequence
% HMM = current model parameters
%
% hmmo = updated model parameters


hmmupdatev.m
% 
% Compute updated HMM model from observations y using Viterbi methods
% Assumes only a single observation sequence.
%
% function HMM = hmmupdatev(y,HMM) 
%
% y = sequence of observations
% HMM = old HMM (to be updated)
%
% hmmo = updated HMM


hmmupfv.m
% 
% Compute an update to the distribution f based upon the data y
% and the (assumed) state assignment in statelist
%
% function fnew = hmmupfv(y,statelist,n,f)
%
% y = sequence of observations
% statelist = state assignments
% n = number of states
% f = distribution (cell) to update
%
% fnew = updated distribution


houseleft.m
%
% Apply the Householder transformation based on v to A on the left
%
% function A = houseleft(A,v)
%
% A = an mxn matrix
% v = a household vector
%
% B = H_v A


houseright.m
%
% Apply the householder transformation based on v to A on the right
%
% function A = houseright(A,v)
%
% A = an mxn matrix
% v = a household vector
%
% B = H_v A


ifs3a.m
% Plot the logistic map and the orbit of a point
%


initcluster.m
%
% 
% Choose an initial cluster at random
% 
% function Y = initcluster(X,m)
%
% X = input data: each column is a training data vector
% m = number of clusters
% Y = initial cluster: each column is a point


initpoisson.m
% 
% Initialize the global variables for the poisson generator
% 
% function initpoisson


initvit1.m
% 
% Initialize the data structures and pointers for the Viterbi algorithm
% 
% function initvit1(intrellis, inbranchweight, inpathlen, innormfunc)
%
% intrellis: a description of the successor nodes 
%    e.g. [1 3; 3 4; 1 2; 3 4]
% inbranchweight: weights of branches used for comparison, saved as
%    cells in branchweight{state_number, branch_number}
%    branchweight may be a vector
%    e.g.  branchweight{1,1} = 0; branchweight{1,2} = 6;
%          branchweight{2,1} = 3; branchweight{2,2} = 3;
%          branchweight{3,1} = 6; branchweight{3,2} = 0;
%          branchweight{4,1} = 3; branchweight{4,2} = 3;
% inpathlen: length of window over which to compute
% normfun: the norm function used to compute the branch cost


invwavetrans.m
%
% Compute the inverse discrete wavelet transform 
%
% function c = invwavetrans(C,ap,coeff)
%
% C = input data (whose inverse transform is to be found)
% ap = index for start of coefficients for the jth level
% coeff = wavelet coefficients
%
% c = inverse transformed data


invwavetransper.m
%
% Compute the periodized inverse discrete wavelet transform 
%
% function c = invwavetransper(C,coeff,J)
%
% C = input data
% coeff = wavelet coefficients
% J = (optional) number of levels of inverse transform to compute
%    If length(C) is not a power of 2, J must be specified.
%
% c = inverse discrete wavelet transform of C


irwls.m
% 
% Computes the minimum solution c to ||x-Ac||_p using
% iteratively reweighted least squares
%
% function c = irwls(A,x)
%
% A = system matrix
% x = rhs of equation
% p = L_p norm
%
% c = solution vector


jacobi.m
% 
% Produce an updated solution x to Ax = b using Jacobi iteration
%
% function x = jacobi(A,x,b)
%
% A = input matrix
% x = initial solution
% b = right-hand side
% 
% Output x= updated solution


kalex1.m
% Kalman filter example 1
%


kalman1.m
% 
% Computes the Kalman filter esimate xhat(t+1|t+1)
% for the system x(t+1) = Ax(t) + w
%                y(t) = Cx(t) + v
% where cov(w) = Q  and cov(v) = R, 
% The prior estimate is x0, and the prior covariance is P0.
% 


karf.m
%
% Evaluate the potential function f(x,c)
% for karmarkers algorithm
%
% function f = karf(x,c)
% 
% x = value of x
% c = constraint vector
%
% f = potential function


karmarker.m
% 
% Implement a Karmarker-type algorithm for linear programming
% to solve a problem in "Karmarker standard form"
%  min       c'x
% subject to Ax=0,  sum(x)=1, x >=0
%
% function x = karmarker(A,c)
%
% A,c = system matrices
%
% x = solution


kissarma.m
% 
% Determine the ARMA parameters a and b of order p based upon the data in y.
%
% function [a,b] = kissarma(y,p)
%
% y = sequence 
% p = order of AR part
%
% a = AR coefficients
% b = MA coefficients


levinson.m
% 
% Given a vector r = (r_0,r_1,\ldots,r_{n-1}),
% and a vector b = (b_1,b_2,\ldots,b_n)
% solve the nxn Toeplitz system Tx = b
%
% function [y] = levinson(r,b)
%
% Since Matlab has no zero-based indexing, r(1) = r_0
%
% r = vector of coefficients for Toeplitz matrix
% b = right-hand side
% 
% y = solution to Tx = b


lgb.m
% 
% Find m clusters on the data X
%
% function [Y,d] = lgb(X,m)
%
%
% X = input data: each column is a training data vector
% m = number of clusters to find
%
% Y = set of clusters: each column is a cluster centroid
% d = minimum total distortion


lms.m
% 
% Given a (real) scalar input signal x and a desired scalar signal d,
% compute an LMS update of the weight vector h.
% This function must be initialized by lmsinit
%
% function [h,eap] = lms(x,d)
%
% x = input signal (scalar)
% d = desired signal (scalar)
%
% h = updated LMS filter coefficient vector
% eap = (optional) a-priori error


lmsinit.m
%
% Initialize the LMS filter
% 
% function lmsinit(m,mu)
%
% m = dimension of vector
% mu = lms stepsize


logistic.m
% 
% Compute the logistic function y = lambda*x*(1-x)
%
% function y = logistic(x,lambda)
%
% x = input value (may be a vector)
% lambda = factor of the function


lpfilt.m
% 
% Design an optimal linear-phase filter using linear programming
%
% function [h,delta] = lpfilt(fp,fs,n)
%
% fp = pass-band frequency  (0.5=Fs/2)
% fs = stop-band frequency
% n = number of coefficients (assumed odd here)
%
% h = filter coefficients
% delta1 = pass-band ripple


lsfilt.m
%
% Determine a least-squares filter h with m coefficients 
%
% function [h,X] = lsfilt(f,d,m,type)
%
% f = input data
% d = desired output data
% m = order of filter
% type = data matrix type
%     type=1: "covariance" method    2: "autocorrelation" method
%          3: prewindowing           4: postwindowing
%
% h = least-squares filter
% X = (optional) data matrix


makehankel.m
% 
% form a hankel matrix from the input data y
%
% [H] = makehankel(y,m,n)
%
% y = input data  = [y1 y2 ...] (a series of vectors in a _row_)
% m = number of block rows in H
% n = number of block columns in H
%
% H = Hankel matrix formed from y


makehouse.m
%
% Make the Householder vector v such that Hx has zeros in 
% all but the first component
%
% function v = makehouse(x)
%
% x = vector to be transformed
%
% v = Householder vector


massey.m
%
% Return the shortest binary (GF(2)) LFSR consistent with the data sequence y
%
% function [c] = massey(y)
%
% y = input sequence 
%
% c = LFSR connections, c = 1 + c(2)D + c(3)D^2 + ... c(L+1)D^L
%     (Note: opposite from usual Matlab order)


maxeig.m
%
% Compute the largest eigenvalue and associated eigenvector of 
% a matrix A using the power method
%
% function [lambda,x] = maxeig(A)
%
% A = matrix whose eigenvalue is sought
%
% lambda = largest eigenvalue
% x = corresponding eigenvector


mineig.m
% 
% Compute the smallest eigenvalue and associated eigenvector of 
% a matrix A using the power method
% function [lambda,x] = mineig(A)
%
% A = matrix whose eigenvalue is sought
%
% lambda = minimum eigenvalue
% x = corresponding eigenvector


musicfun.m
%
% Compute the "MUSIC spectrum" at a frequency f.
%
% function pf = musicfunc(f,p,V)
%
% f = frequency (may be an array of frequencies)
% p = order of system
% V = eigenvectors of autocorrelation matrix
%
% pf = plotting value for spectrum


neweig.m
% 
% Compute the eigenvalues and eigenvector of a real symmetric matrix A
%
% function [T,Q] = neweig(A)
%
% A = matrix whose eigendecomposition is sought
%
% T = diagonal matrix of eigenvalues
% Q = (optional) matrix of eigenvectors


newlu.m
%
% Compute the lu factorization of A
%
% function [lu,indx] = newlu(A)
%
% A = matrix to be factored
%
% lu = matrix containg L and U factors
% indx = index of pivot permutations


newsvd.m
% 
% Compute the singular value decomposition of the mxn matrix A, as A= u s v'.
% We assume here that m>n
% 
% [u,s,v] = newsvd(A)
% or
% s = newsvd(A)
%
% A = matrix to be factored
% 
% Output:
% s = singular values
% u,v = (optional) orthogonal matrices


nn1.m
%
% Compute the output of a neural network with weights in w
%
% function [y,V,Y] = nn1(xn,w)
% 
% xn = input
% w = cell array of weights
%
% y = output layer output
% V = (optional) internal activity
% Y = (optional) neuron output
%    The optional arguments V and Y are used for training to store output for
%    each layer:
%    Y{1} = input, Y{2} = first hidden layer, etc.
%    V{1} = first hidden layer, etc.


nnrandw.m
% 
% Generate an initial set of weights for a neural network at random,
% based upon the list in m
%
% function w = nnrandw(m)
% m = list of weights 
%   m(1) = number of inputs, m(2) = first hidden layer, etc.
%
% w = random weights


nntrain1.m
%
% Train a neural network using the input/output training data [x,d]
%
% function w = nntrain(x,d,m,ninput,mu)
%
% x = [x(1) x(2) ... x(N)] = input training data   
% d = [d(1) d(2) ... d(N)] = output training data
% nlayer = number of layers
% m = number of neurons on each layer, 
%     m(1) = input layer, ... m(nlayer+1) = ouput layer
% mu = steepest descent step size
% alpha = (optional) momentum constant
% maxiter = (optional) maximum number of iterations (w = no maximum)
% w = (optional) starting weights
%
% w = new weights
% err = (optional) total squared error from training


permutedata.m
% 
% Randomly permute the columns of the data x.
%
% function xp = permutedata(x,type)
%
% x = data to permute
% type=type of permutation
%   type=1: Choose a random starting point, and go sequentially
%   type=2: random selection without replacement (not really a permutation)
%
% xp = permuted x


pisarenko.m
%
% Compute the the modal frequencies using Pisarenko's method,
% then find the amplitudes
%
% function [f,P] = pisarenko(Ryy)
%
% Ryy = autocorrelation function from observed data
%
% f = vector of frequencies
% P = vector of amplitudes


pivottableau.m
% 
% Perform pivoting on an augmented tableau until 
% there are no negative entries on the last row
%
% function [tableau,basicptr] = pivottableau(intableau,inbasicptr)
%
% intableau = input tableau tableau,
% inbasicptr = a list of the basic variables, such as [1 3 4]
%
% tableau = pivoted tableau 
% basicptr = new list of basic variables


poisson.m
% 
% Generate a sample of a random variable x with mean lambda
% (Following Numerical Recipes in C, 2nd ed., p. 294)
% This function should be initialized by initpoisson.m
%
% function x = poisson(lambda)
%
% lambda = Poisson mean
%
% x = Poisson random variable


ptls1.m
% 
% Compute the Partial Total Least Squares solution of Ax = b
% where the first k columns of A are not modified
%
% function [x,Ahat,bhat] = ptls1(A,b,k)
%
% A = system matrix
% b = right-hand side
% k = number of columns of A not modified
%
% x = ptls solution to Ax=b
% Ahat = modified A matrix
% bhat = modified b matrix


ptls2.m
% 
% Find the partial total least-squares solution to Ax = b,
% where k1 rows and k2 columns of A are unmodified
% 
% function [x] = ptls2(A,b,k1,k2)
%
% A = system matrix
% b = right-hand side
% k1 = number of rows of A not modified
% k2 = number of columns of A not modified
%
% x = PTLS solution to Ax=b


qf.m
% 
% Compute the Q function:
%
% function p = qf(x)
%   p = 1/sqrt(2pi)int_x^infty exp(-t^2/2)dt


qfinv.m
% 
% Compute the inverse of the q function
%
% function x = qfinv(q)


qrgivens.m
% 
% Compute the QR factorization of a matrix A without column pivoting
% using Givens rotations
%
% function [R,thetac,thetas] = qrgivens(A)
% 
% A = mxn matrix (assumed to have full column rank)
%
% R = upper triangular matrix
% thetac = matrix of c values 
% thetas = matrix of s values (these must be converted to Q)


qrhouse.m
% 
% Compute the QR factorization of a matrix A without column pivoting
% using Householder transformations
% 
% function [V,R] = qrhouse(A)
%
% 
% A = mxn matrix (assumed to have full column rank)
%
% V = [v1 v2 ... vn] = matrix of Householder vectors 
%           (must be converted to Q ) using qrmakeq.
%           
% R = upper triangular matrix


qrmakeq.m
% 
% Convert the V matrix returned by qrhouse into a Q matrix
% 
% function Q = qrmakeq(V)
%
% V = [v1 v2 .... vr], Householder vectors produced by qrhouse
%
% Q = [Q1 Q2 ... Qr], the orthogonal matrix in the QR factorization


qrmakeqgiv.m
% 
% Given thetac and thetas containing rotation parameters from Givens rotations,
% (produced using qrqrgivens), compute Q
% function Q = qrmakeqgiv(thetac,thetas)
% 
% thetac = cosine component of Givens rotation
% thetas = sin component of Givens rotation
%
% Q = orthogonal matrix formed by Givens rotations


qrqtb.m
% 
% Given a matrix V containing Householder vectors as columns
% (produced using qrhouse), compute Q^H B, where Q is formed (implicitly)
% from the Householder vectors in V.
%
% function [B] = qrqtb(B,V)
% 
% B = matrix to be operated on
% V = matrix of Household vectors (as columns)
%
% output: B = Q^H B


qrqtbgiv.m
% 
% Given thetac and thetas containing rotation parameters from Givens rotations,
% (produced using qrqrgivens), compute Q^H B, where Q is formed (implicitly)
% from the rotations in Theta.
%
% function [B] = qrqtbgiv(B,thetac,thetas)
%
% B = matrix to be opererated on
% thetac = cosine component of rotations from Givens rotations
% thetas = sine component of rotations from Givens rotations
%
% Output: B <-- Q^H B


qrtheta.m
% 
% Given x and y, compute cos(theta) and sin(theta) for a Givens rotation
%
% function [c,s] = qrtheta(x,y)
%
% (x, y) = point to determine rotation
%
% c = cos(theta),   s=sin(theta)


reducefree.m
% 
% Perform elimination on the free variables in a linear programming problem
%
% function [A,b,c,value,savefree,nfree] = reducefree(A,b,c,freevars)
% 
% A,b,c = parameters from linear programming problem
% freevars = list of free variables
%
% A,b,c = new parameters for linear programming problem (with free variables
%         eliminated)
% value = value of linear program
% savefree = tableau information for restoring free variables
% nfree = number of free variables found


refltodir.m
% 
% Convert from a set of reflection coefficients kappa(1)...kappa(m)
% to FIR filter coefficients in direct form
%
% function a = refltodir(kappa)
%
% kappa = vector of reflection coefficients
%
% a = output filter coefficients = [1 a(1) a(2) ... a(m)]


restorefree.m
% 
% Restore the free variables by back substitution
%
% function x = restorefree(inx,savefree,freevars)
% 
% inx = linear programming solution (without free variables)
% savefree = information from tableau for substitution
% freevars = list of free variables
% 
% x = linear programming solution (including free variables)


rls.m
%
% Given a scalar input signal x and a desired scalar signal d,
% compute an RLS update of the weight vector h.
%
% This function must be initialized by rlsinit
%
% function [h,eap] = rls(x,d)
%
% x = input signal
% d = desired signal
%
% h = updated filter weight vector
% eap = (optional) a-priori estimation error


rlsinit.m
%
% Initialize the RLS filter
%
% function rlsinit(m,delta)


simplex1.m
% 
% Find the solution of a linear programming problem in standard form
%  minimize c'x
%  subject to Ax=b
%             x >= 0
%
% function [x,value,w] = simplex1(A,b,c,freevars)
% 
% A, b, c: system problem
% freevars = (optional) list of free variables in problem
%
% x = solution
% value = value of solution
% w = (optiona)l solution of the dual problem.
%    If w is used as a return value, then the dual problem is also solved.
%    (In this implementation, the dual problem cannot be solved when free
%    variables are employed.)


sor.m
% 
% Produce an updated solution x to Ax = b successive over-relaxation
% A must be Hermitian positive definite
%
% function x = sor(A,x,b)
%
% A = input matrix
% x = initial solution
% b = right-hand side
% omega = relaxation parameter
% 
% Output x= updated solution


sysidsvd.m
% 
% given a sequence of impulse responses in h
% identify a system (A,B,C)
%
% function [A,B,C] = sysidsvd(h,tol)
% h = impulse responses (a cell array)
% tol = (optional) tolerance used in rank determination
% ord = system order (overrides tolerance)
%
% (A,B,C) = estimated system matrix parameters


testet.m
% testet.m
% Test the emission tomography code
% This script loads an image file, plots it, then calls the 
% code to test the tomographic reconstruction


testirwls.m
% Test the irwls routine for a filter design problem
% After [Burrus 1994, p. 2934]


testnn10.m
% Test the neural network on a pattern recognition problem
%


tls.m
% 
% determine the total least-squares solution of Ax=b
%
% function x = tls(A,b)
%
% A = system matrix
% b = right-hand side
%
% x = TLS solution to Ax=b


tohankel.m
% 
% Determine the matrix nearest to A which is Hankel and has rank r
% using the composite mapping algorithm
%
% function A = tohankel(A,r)
%
% A = input/output matrix
% r = desired rank
%
% Ouptut A = Hankel matrix with desired properties
% d = norm of difference between matrices


tohanktoep.m
% 
% Determine the matrix nearest to A which is the stack
%  [ Hankel
%    Toeplitz ] 
% with rank r using the composite mapping algorithm
%
% function A = tohantoep(A,r)
%
% A = input matrix
% r = desired rank
%
% output: A = matrix with desired properties
% normlist = (optional) vector of errors


tokarmarker.m
% 
% Given a linear programming problem in standard form
%  min       c'x
% subject to Ax = b,  x >= 0
%
% return new values of A and c in "Karmarker standard form"
%  min       c'x
% subject to Ax=0,  sum(x)=n, x >= 0
%
% function [Anew,cnew] = tokarmarker(A,b,c)
%
% (A,b,c) = matrices in standard form
%
% Anew, cnew = matrices in Karmarker standard form


tostoch.m
% 
% Determine the matrix nearest to A which is stochastic using
% the composite mapping algorithm
%
% function A = tostoch(A)
% A = input matrix
%
% Output: A = nearest stochastic A


tridiag.m
% 
% tridiagonalize the real symmetric matrix A
% 
% function [T,Q] = tridiag(A)
%
% A = matrix whose tridiagonal form is sought
%
% T = tridiagonal matrix
% Q = (optional) orthogonal transformation


vitbestcost.m
% 
% Returns the best cost so far in the Viterbi algorithm
%
% function c = vitbestcost


viterbi1.m
% 
% Run the Viterbi algorithm on the input for one branch
% Before calling this function, you must call initvit1
%
% function [p] = viterbi1(r)
%
% r = input value (scalar or vector)
%
% p = 0 if number of branches in window is not enough
% p = statenum on path if enough branches in window
%
% Call vitflush to clear out path when finished


vitflush.m
% 
% Flush out the rest of the viterbi paths
%
% function [plist] = vitflush(termnode)
%
% termnode = 0 or list of allowable terminal nodes
%    If termnode==0, then choose path with lowest cost
%    Otherwise, choose path with best cost among termnode
%
% plist = list of paths from trellis


warp.m
% 
% find the dynamic warping between A and B (which may not be of the
% same length)
%
% function [path] = warp(A,B)
%
% A = cells of the vectors, A{1}, A{2}, ..., A{M}
% B = cells of the vectors, B{1}, B{2}, ..., B{N}
%
% path = Kx2 array of (i,j) correspondence


warshall.m
% 
% Find the transitive closure of the graph represented by the adjacency
% matrix A
%
% function Anew = warshall(A)
%
% A = adjacency matrix of graph
% 
% Anew = adjacency matrix for transitive closure of graph


wavecoeff.m
% Coefficients for Daubechies wavelets
%


wavetest.m
% Test the wavelet transform in matrix notation


wavetesto.m
% Test the wavelet transform in wavelet notation (alternate indexing)


wavetrans.m
%
% Compute the (nonperiodized) discrete wavelet traqnsform 
%
% function [C,ap] = wavetrans(c,coeff,J)
%
% c = data to be transformed
% coeff = wavelet transform coefficients
% J = number of levels of transform
%    If J is specified, then J levels of the transform are computed.  
%    Otherwise, the largest possible number of levels are used.
%
% C = transformed data
%     The output is stacked in C in wavelet-coefficient first order,
%     C = [d1 d2 ... dJ cJ]
% ap indexes the start of the coefficients for the jth level,
%     ap(j+1) indexes the start of the coefficients for the jth level,
%     except that ap(1) indicates the number of original datapoints
%
% This function simply stacks up the data for a call to the function wave


wavetransper.m
%
% Compute the periodized discrete wavelet transform of the data
%
% function [C] = wavetransper(c,coeff,J)
%
% c = data to be transformed
% coeff = transform coefficients
% J indicates how many levels of the transform to compute.
%    If length(c) is not a power of 2, J must be specified.
%
% C = output vector
%    The output is stacked in C in wavelet-coefficient first order,
%    C = [d1 d2 ... dJ cJ]


wftest.m
% Test the Wiener filter equalizer for a first-order signal and first-order
% channel


zerorow.m
% 
% Zero a row by a series of Givens rotations
%
% function [B,U] = zerorow(B,f,U)
%
% B = matrix to have row zeroed
% f = vector of row indices that are zero on the diagonal
% U = (optional) rotation matrix
%
% B = modified matrix
% U = (optional) rotation matrix


***************************************************************
Directory: misc
***************************************************************
H.m
% 
% Compute the binary entropy function
% 
% function h = H(p)
%
% p = crossover probability
%
% h = binary entropy


b2n.m
% convert an m-bit binary sequence b to an integer


bernapprox.m
% Plot Bernstein polynomials


bernpoly.m
% 
% compute the Bernstein polynomial g_{nk}(t)
%
% function g = bernpoly(n,k,t)
%
% n = degree
% k = order
% t = location
% 
% g = value


bsplineval1.m
% 
% When f(x) = sum_i c_i^k B_i^k(x)
% where B_i^k is the kth order spline across t_i,t_{i+1},\ldots,t_{i+k+1}
% This function evaluates f(x) for a given x.
% (See Kincaid-Cheney, p. 396)
%
% function s = bsplineval1(c,t,x,k)
%
% c = set of coefficients
% t = knot set
% x = value.  x must fall in range of knots, t_i <= x < t_{i+1}
% k = order
%
% s = spline value


chebinterp.m
% data for  Chebyshev interpolation example


chi2.m
% 
% Compute the pdf for a chi-squared random variable
%
% function f = chi2(x,n)
%
% x = value
% n = order of chi-squared
%
% f = pdf value


compmap1.m
% Test the composite mapping algorithm on the positive sequence


compmap4.m
% test the positive semi-definite mapping


computeremez.m
% Test the remez algorithm


crtgamma.m
% 
% Compute the gammas for the CRT
%
% function gamma = crtgamma(m)
%
% m = set of modulos
%
% gamm = set of gammas


crtgammapoly.m
% 
% Compute the gammas for the CRT for polynomials
%
% function gamma = crtgammapoly(m)
%
% m = set of modulos (polynomials)
%
% gamma = set of gammas (polynomials)


crypttest.m
% test the cryptographic example


d2b.m
% convert n to an m-bit binary representation


diagstack.m
% Stack matrices diagonally:
% D = [X 0
%      0 Y];
%
% function D = diagstack(X,Y)
% X, Y = input matrices
%
% D = diagonal stack


discapprox.m
% find a discrete approximating polynomial


divdiff.m
% 
% Compute the upper row of a divided difference table
%
% function c = divdiff(ts,fs)
%
% ts = sample locations
% fs = function values
%
% c = set of divided differences


eigfilcon0.m
%
% Find eigenilter constrained so that response is 0 at some frequencies
%
% function h = eigfilcon(wp,ws,N,alpha, Wo)
%
% wp = passband frequency
% ws = stopband frequency
% m = number of coefficients (must be ODD)
% alpha = tradeoff parameter between stopband and passband
% Wo = list of constraint frequencies at which response is 0
%
% h = filter coefficients


eigfilcon0new.m
%
% Find eigenilter constrained so that response is 0 at some frequencies
%
% function h = eigfilcon(wp,ws,N,alpha, Wo)
%
% wp = passband frequency
% ws = stopband frequency
% m = number of coefficients (must be ODD)
% alpha = tradeoff parameter between stopband and passband
% Wo = list of constraint frequencies at which response is 0
%
% h = filter coefficients


elem.m
%
% Return an elementary matrix E_{rs} of size mxn


fact.m
% compute the factorial


findprim5.m
% Find a primitive polynomial in GF(5)


fromcrt.m
% 
% Given a sequence [y1,y2,\ldots,y2] that is a representation 
% of an integer x in CRT form, convert back to x.
%
% function x = fromcrt(y,m)
%
% y = sequence
% m = [m1,m2,...,mr]
% gammain (optional) = set of gamma factors.  
%   If not passed in, gamma is computed
%
% x = integer representation
% gamma = gamma values


fromcrtpoly.m
% 
% Compute the representation of the polynomial f using the Chinese Remainder
% Theorem (CRT) using the moduli m = [m1,m2,...,mr].  It is assumed 
% (without checking) that the moduli are relatively prime.  
% Optionally, the gammas may be passed in (speeding computation), and
% are returned as optional return values.
%
% function [f,gamma] = fromcrtpoly(y,m,gammain)
% function [f] = fromcrtpoly(y,m)
% function [f,gamma] = fromcrtpoly(y,m)
% function [f] = fromcrtpoly(y,m,gammain)
%
% y = list of polynomials (cell array)
% m = list of moduli (cell array)
% gammain = (optional)list of gammas (cell array)
%
% f = reconstructed polynomial
% gamma = gamma


fromhankel.m
%
% Pull sequential data out of a Hankel matrix X 
%
% X = Hankel matrix
% d = (optional) dimension of data
%
% x = Sequential data


fromhankel2.m
% Pull sequential data out of a Hankel matrix X  (cell array version)
%
% X = Hankel matrix
% d = (optional) dimension of data
%
% x = Sequential data (in a cell array)


gam1.m
% 
% Determine the optimum bet on a subfair track
%
% function [B,b0,b,l] = gam1(p,o)
%
% p = probability of win
% o = subfair odds
%
% B = other bets
% b0 = amount witheld
% b = bet


gcdint1.m
% 
% Compute (only) the GCD (a,b) using the Euclidean algorithm
%
% function g = gcdint1(b,c)
%
% b,c = integers
%
% g = GCD(b,c)


gcdint2.m
% 
% Compute the GCD g = (b,c) using the Euclidean algorithm
% and return s,t such that bs+ct = g
%
% function [g,s,t] = gcdint2(b,c)
%
% b,c = integers
% g = GCD(b,c)
% s,t = integers


gcdpoly.m
% 
% Compute the GCD g = (b,c) using the Euclidean algorithm
% and return s,t such that bs+ct = g, where b and c are polynomials
% with real coefficients
%
% function [g,s,t] = gcdpoly(b,c)
%
% b,c = polynomials
% thresh = (optional) threhold argument used to truncate small remainders
%
% g = GCD(b,c)
% s,t = polynomials


genardat.m
% 
% Generate N points of AR data with a = [a(1) a(2), \ldots, a(n)]'
% and input variance sigma^2
%
% function x = genardat(a,sigma,N)
%
% a = AR parameters
% sigma = standard deviation of input noise
% N = number of points
%
% x = AR process


greedyperm.m
% 
% Using a greedy algorithm, determine a permutation P such that Px=z
% as closely as possible.
%
% function P = greedyperm(x,z)


greedyperm2.m
% 
% Using a greedy algorithm, determine a permutation P such that Px=z
% as closely as possible.
% This algorithm is more complex than greedyperm
%
% function P = greedyperm2(x,z)


haar1.m
% Do the computations for the Haar transform, working toward the
% wavelet lifting transform
%
% s = input data
% nlevel = number of levels
%
% h = Haar transform


haarinv1.m
% Do the computations for the inverse Haar transform, working toward the
% wavelet lifting transform


hmmApiup.m
% 
% Update the A and pi probabilities in the HMM using the forward and
% backward probabilities alpha and beta
%
% function [A,pi] = hmmapiup(y,alpha,beta,HMM)
%
% y = input sequence
% alpha = forward probability
% beta = backward probability
% f = distribution
% HMM = model parameters
%
% A = updated state transition probability
% pi = updated initial state probability


hmmab.m
% 
% Compute the forward and backward probabilities for the model HMM
% and the output probabilities


hmmdiscfup.m
% 
% Update the output probability distribution f of the HMM using the forward
% and backward probabilities alpha and beta
%
% function f = hmmdiscfup(y,alpha,beta,HMM)
%
% y = input sequence
% alpha = forward probabilities
% beta = backward probabilities
% HMM = current model parameters
%
% f = updated distribution


hmmfupdate.m
% 
% Provide an update to the state output distributions for the HMM model
%
% function f = hmmfupdate(y,alpha,beta,HMM)
% 
% y = input sequence
% alpha = forward probabilities
% beta = backward probabilities
% HMM = current model parameters
% 
% f = updated distribution


hmmgausfup.m
% 
% Update the Gaussian output distribution f of the HMM using the
% probabilities alpha and beta
%
% function f = hmmgausfup(y,alpha,beta,HMM)
% 
% y = input sequence
% alpha = forward probabilities
% beta = backward probabilities
% HMM = current model parameters
% 
% f = updated distribution


hmmlpyseq.m
%
% Find the log likelihood of the sequence y[1],y[2],...,y[T], 
% i.e., compute log P(y|HMM)
%
% function lpy = hmmlpyseq(y,HMM)
%
% y = input sequence
% HMM = current model parameters


hmmupdate.m
% 
% Compute updated HMM model from observations (nonnormalized)
%
% function HMM = hmmupdate(y,HMM) 
%
% y = output sequence
% HMM = current model parameters
%
% hmmo = updated model


ifs2.m
% test some ifs stuff


ifs2ex.m
% find an affine transformation Ax + b that transforms from
% {x00,x10,x20,x30} to {x01,x11,x21,x31}


initvit2.m
% 
% Initialize the data structures and pointers for the Viterbi algorithm
%
% function initvit2(intrellis, inbranchweight, inpathlen, innormfunc)
%
% intrellis: a description of the successor nodes using a list, e.g.
%          intrellis{1} = [1 3]; intrellis{2} = [3 4];
%          intrellis{3} = [1 2]; intrellis{4} = [3 4];
% inbranchweight: weights of branches used for comparison, saved as
%    cells in branchweight{state_number, branch_number}
%    branchweight may be a vector
%    e.g.  branchweight{1,1} = 0; branchweight{1,2} = 6;
%          branchweight{2,1} = 3; branchweight{2,2} = 3;
%          branchweight{3,1} = 6; branchweight{3,2} = 0;
%          branchweight{4,1} = 3; branchweight{4,2} = 3;
% inpathlen: length of window over which to compute
% normfun: the norm function used to compute the branch cost


interplane.m
% 
% find the intersecting point for the planes
%  m1'(x-x1) = 0   and  m2'(x-x2)=0.
%
% function x = interplane(m1,x1,m2,x2)
%
% m1 = normal to plane
% x1 = point on plane
% m2 = normal to plane
% x2 = point on plane
%
% x = intersecting point


invdiff.m
% 
% Compute the inverse differences for a rational interpolation function,
% returning the vector of inverse differences that are necessary for
% interpolation
%
% function phis = invdiff(ts,fs)
%
% ts = vector of independent variable
% fs = vector of dependent variable
%
% phis = inverse differences


jordanex.m
% example of Jordan forms


kaisfilt.m
% test the design of a Kaiser filter


kronsum.m
%
% Kronecker sum of A and B.  A and B are assumed square.
%
% function C = kronsum(A,B).  


lagrangepoly.m
% 
% Lagrange interpolator


latexform.m
% 
% Display a matrix X in latex form
%
%function latexform(fid,X,[nohfill])
% 
% fid = output file id (use 1 for terminal display)
% X = matrix of vector to display
% nohfill = 1 if no hfill is wanted


lfsr.m
% 
% Produce m outputs of an lfsr with coefficient c and initial values y0
%
% function y = lfsr(c,y0,m)
% y0 = [y_0,...,y_{p-2},y_{p-1}]
% c = [c(1),c(2),...,c(p)]
% 
% y_j = sum_{i=1}^p y_{j-i} c(i)


lfsrfind.m
% 
% Find a good lfsr c to match Ac=b
%
% function c = lfsrfind(A,b)


lfsrfind2.m
% 
% Find a good lfsr c to match Ac=b
% where A and b are formed by the lfsr
% In this case, feed the error back around
%
% function c = lfsrfind2(y,m)


lsdata.m
% Make least-squares data matrices 


makemarkov.m
% 
% Return the sequence of n impulse response samples into the cell array y
% y{1},y{2}, ... y{n}
%
% function y = makemarkov(A,B,C,n)
%
% (A,B,C) = system
% n = number of samples
%
% y = cell array of impulse responses


makeperm.m
% Return all permutations of length n


maketoeplitz.m
% 
% Form a toeplitz matrix from the input data y
%
% function [H] = maketoeplitz(y,m,n)
%
% y = input data = [y1 y2 ...] (a series of vectors in a _row_)
% m = number of block rows in H
% n = number of block columns in H


marv.m
% 
% Prony: given a sequence of (supposedly) pure sinusoidal data, 
% determine the frequency using model methods
%
% function f = marv(x,fs)
% x = data sequence
% fs = sampling rate
%
% f = frequencies found


masseyinit.m
% Initialize the iteratively called massey's algorithm
%
% function masseyinit()


masseyit.m
% 
% Compute the lfsr connection polynomial using Massey's algorithm
% accepting new data at each iteration.
% masseyinit should be called before calling this the first time
%
% y = new data point
%
% c = updated connection polynomial


miniapprox1.m
% minimax approximation example


modaldata1.m
% data for a modal analysis problem


myplaysnd.m
% 
% Modified and simplified from playsnd, to make the sample rate stuff work


n2b.m
% convert n to an m-bit binary representation


neville.m
% 
% Neville's algorithm for computing a value for an interpolating polynomial
% y = NEVILLE(x,X,Y) takes the (xi,yi) coordinate pairs in the
% vectors X and Y and computes the value of the unique
% interpolating polynomial that passes through the list of points
% at the given value of x. 
% 
% function y = neville(x, X, Y)
%
% x = interpolated point
% X = X data
% Y = Y data
%
% y = interpolated value


nntrain2.m
% 
% train a neural network using the input/output training data [x,d]
% with sequential selection of the data
%
% function w = nntrain(x,d,m,ninput,mu)
%
% x = [x(1) x(2) ... x(N)]   
% d= [d(1) d(2) ... d(N)]
% nlayer = number of layers
% m = number of neurons on each layer, 
%     m(1) = input layer, ... m(nlayer+1) = ouput layer
% mu = steepest descent step size
% alpha = (optional) momentum constant
% maxiter = (optional) maximum number of iterations (w = no maximum)
% w = (optional) starting weights
%
% err = (optional) total squared error from training


pade1.m
% Pade example


padefunct.m
% 
% Find the Pade approximation from the Maclaurin series coefficients
%
% function [A,B] = padefunct(c,m,k)
%
% c = Maclaurin series coefficients (need m+k+1)
% m = degree of numerator polynomial
% k = degree of denominator polynomial
%
% A = coefficients of numerator polynomial (in Matlab order)
% B = coefficients of denominator polynomial (in Matlab order)


permer.m
% 
% function permlist = permer(n1,p,perm,permnew,permlist)


pisexamp.m
% Example for Pisarenko Harmonic Decomposition


plotbernapprox.m
% plot the Benstein polynomial approximation to $f(t) = e^t$


plotbernpoly.m
% plot the Benstein polynomial


plotfplane.m
% plot a function and a linear approximating surface


plotplane.m
% determine points in the plane m'(x-x0) = 0 for plotting purposes
% 


polyadd.m
%
% Add the polynomials p=a+b
% 
% function p = polyadd(a,b)
%
% a,b = polynomial
%
% p = polynomial sum.


polydiv.m
% 
% Divide a(x)/b(x), and return quotient and remainder in q and r
% Coefficients are assumed to be in Matlab standard order (highest order first)
%
%
% function [q,r] = polydiv(a,b)
%
% a = numerator
% b = denominator
%
% q = quotient
% r = remainder


polydivgfp.m
% 
% Divide a(x)/b(x), and return quotient and remainder in q and r
% using arithmetic in GF(p)
% Coefficients are assumed to be in Matlab standard order (highest order first)
%
% function [q,r] = polydivgfp(a,b)
%
% a = numerator
% b = denominator
%
% q = quotient
% r = remainder


polymult.m
% 
% Multipoly the polynomials p=a*b
%
% function p = polymult(a,b)
%
% a,b = polynomials
%
% p = product


polysub.m
% 
% Subtract the polynomials p=a-b
%
% a,b = polynomials
%
% p = difference


psdarma.m
%
% Plot the psd of an arma model
%
% function [w,h] = psdarma(b,a)
%
% b = numerator coefficients
% a = denominator coefficients
%
% w = frequency values
% h = absolute value of response


ratinterp.m
% 
% Compute the rational function interpolation
% from the data in ts and fs.
% Polynomial coefficients returned in Matlab order (largest to smallest)


ratinterp1.m
% 
% Compute a single interpolated point f(t) given the interpolating data
% and the inverse differences
%
% function f = ratinterp1(t,ts,fs,phis)
%
% t = point at which to evaluate
% ts = vector of independent data
% fs = vector of depdendent data
% phis = inverse differences
%
% f = interpolated value


ratintfilt.m
% Try some data for a rationally-interpolated filter


res.m
% 
% Computes <a^n>_m
%
% function d = res(a,n,m)
%
% a = value
% n = exponent
% m = modulo
%
% d = remainder(a^n,m0


schurcohn.m
% 
% Returns 1 if p is a Schur polynomial (all roots inside unit circle)
%
% function stable = schurcohn(p)
% 
% p = polynomial coefficients
%
% stable = 1 if stable polynomial


simppivot.m
% 
% Pivot a linear programming tableau about the p,q entry
% 
% function tableau = simppivot(intableau,p,q)
%
% intableau = tableau
% (p,q) = point about which to pivot
%
% tableau = pivoted tableau


solvlincong.m
% 
% Ddetermine the solution to the linear congruence
% a x equiv b (mod m), if it exists
%
% function x = solvlincong(a,m,b)


sreal.m
% sysreal.m
% data for the system identification example in the SVD stuff


sreal1.m
% SVD realization


sugiyama.m
% 
% Compute the GCD g = (b,c) using the Euclidean algorithm
% and return s,t such that bs+ct = g, where b and c are polynomials
% with real coefficients
%
% thresh = (optional) threshold argument used to truncate small remainders


sysidsvd2.m
% 
% given a sequence of impulse responses in h (a cell array)
% identify a system (A,B,C)
% This uses the tohankel method of finding a nearest hankel matrix
% of desired rank
%
% function [A,B,C] = sysidsvd(h,order)
%
% h = impulse response sequence (cell array)
% order = desired order of system
%
% (A,B,C) = system


taylorf.mm
(* example of a taylor series *)


tocrt.m
% 
% Compute the representation of the scalar x using the
% using the Chinese Remainder Theorem (CRT) with
% moduli m = [m1,m2,...,mr].  It is assumed (without checking)
% that the moduli are relatively prime
%
% function y = tocrt(x,m)
%
% x = number to convert
% m = set of moduli
%
% y = CRT representation of x


tocrtpoly.m
% 
% Compute the representation of the polynomial f using the
% using the Chinese Remainder Theorem (CRT) with
% moduli m = {m1,m2,...,mr}.  It is assumed (without checking)
% that the moduli are relatively prime.
% m is passed in as a cell array containing polynomial vectors
% and y is returned as a cell array containing polynomial vectors
%
% function y = tocrt(f,m)
%
% f = polynomial
% m = set of modulo polynomials
%
% y = CRT form of f


tohankelbig.m
% 
% Determine the matrix nearest to A which is (block) Hankel and has rank r
% using the composite mapping algorithm
%
% function A = tohankelbig(A,r)
%
% A = input matrix
% r = desired ranke
% d = (optional) block size (default=1)
%
% A = nearest rank r Hankel matrix
% diff = norm of difference between matrices


triginterp.m
% demonstrate trigonometric interpolation


vandsolve1.m
%
% Solves the equation Vx = fs, where V is the Vandermonde
% matrix determined from ts.
%
% function a = vandsolve1(ts,fs)
%
% ts = abscissa values
% fs = ordinate values
%
% a = solution


vitnop.m
% 
% Compute the norm of the difference between inputs
% This function may be feval'ed for use with the Viterbi algorithm
% In this case, the norm is simply taken as the branch number
%
% function d = vitnop(branch,input)
%


vitsqnorm.m
% 
% Compute the square norm of the difference between inputs
% This function may be feval'ed for use with the Viterbi algorithm
% (state and nextstate are not used here)
%
% function d = vitsqnorm(branch,input,state,nextstate)


wino3by3.m
% 
% Convolve the 3-sequence a with the 3-sequence b 
% a and b are both assumed to be column vectors
% using Winograd convolution
%
% function c = wino3by3(a,b) 


winotest.m
% Set up data for a Winograd convolution algorithm


winotest2.m
% Set up data for a Winograd convolution algorithm 


***************************************************************
Directory: mkpict
***************************************************************
attract1.m
% a plot showing an attractor


attract2.m
% a plot showing an attractor


bayes1.m
% Bayes decision tests


bayes2.m
% Bayes decision tests for Gaussian


bayes4.m
% show the decision regions for a 3-way test


binchan.m
% 
% Data for Bayesian detection on the binary channel


binchanex.m
% data for binary channel


chebyplot.m
% Plot Chebyshev polynomials


chi2plot.m
% 
% Plot the chi-squared r.v.


compmap3.m
% make figure comppos1


condhilb.m
% Plot the condition of the Hilbert matrix


drawtrellis.m
% 
% Draw a trellis in LaTeX picture mode
%
% function drawtrellis(fid,numbranch,r,p)
%
% fid = output file id
% numbranch = number of branches to draw
% r = path cost values
% p = flag
%
% Other values are contained in global variables.  See the file


drawtrelpiece.m
%
% Draw a piece of a trellis in LaTeX picture mode
%
% fname = file name
% trellis = trellis description
% branchweight = weights of branches


drawvit.m
% Program to draw the paths for the Viterbi algorithm using a LaTeX picture


duality1.m
% Make a plot illustrating duality


eigdir.m
% make a contour plot of eigenstuff


eigdir2.m
% make a contour plot of eigenstuff


eigdirex.m
% make a contour plot of eigenstuff


eigdist.m
% show the asymptotic equal distribution of eigenvalues


ellipse.m
% Plot contours of an ellipse with large eigenvalue disparity
% and the results of steepest descent


ellipsecg.m
% Plot contours of an ellipse with large eigenvalue disparity
% and the results of conjugate gradient.


entplot.m
% plot the binary entropy function


expmod.m
% Test Cadzow's results on the sinusoidal modeling


fourser.m
% example Fourier series


hilb1.m
% Program to generate the data for the hilbert approximation to
% the exponential function


ifs3.m
% Plot the logistic map and the orbit of a point


ifs3b.m
% Plot the logistic map and the orbit of a point
% do not specify lambda and x0 here: it is done by an upper script


ifs4.m
% Demonstrate the logistic map


ifsex3.m
% find an affine transformation Ax + b that transforms from
% {x00,x10,x20} to {x01,x11,x21}


ifsfig1.m
% Make side-by-side figures


legendreplot.m
% Plot legendre polynomials


makeim.m
% make a test image for tomography example


matcond.m
% Make an ill-conditioned matrix of sinusoids.


matcond2.m
% Set up an ill-conditioned matrix of sinusoids


min1.m
% make the contour plot for wftest


min2.m
% make the contour plot for wftest


moveiter.m
% test the solution of a moving RHS in the equation Ax=b


newt1.m
% Demonstrate newton's stuff


newt2.m
% Demonstrate newton's stuff on Rosenbrocks function


oddeven.m
% data for odd/even game


orthog.mma
(* sample file for orthogonalization *)


patrec1.m
% generate some simple pattern recognition example data


plotI0.m
% Plot the Bessel function


plotJsurf.m
% plot a quadratice error surface


plotbpsk.m
% Plot the probability of error for BPSK


plotgauss.m
% Plot the Gaussian function


plotgauss2.m
% Plot approximations to the central limit theorem


plotgauss3.m
% plot a Gauss surface plot


plotwavelet.m
% plot the wavelet data


roc1.m
% plot the roc for a gaussian r.v.


roc2.m
% plot the roc for a a xi^2


roc3.m
% plot the roc for a gaussian r.v. and its conjugate


rosenbrock.m
% Plot the Rosenbrock function contours


rosengrad.m
% 
% compute the gradient of the rosenbrock function for test purposes
% function grad = rosengrad(x)


saddle1.m
% make a saddle plot 


scatter.m
% create a scatter plot to demonstrate principal component


scatterex.m
% create a scatter plot to demonstrate principal component


sigmoid.m
% plot the sigmoid function


steeperr.m
% Plot errors of the steepest descent


steeperrplot.m
% Make plots of error for steepest descent


steepest1.m
% Demonstrate steepest descent on Rosenbrocks function


sugitest.m
% test the Sugiyama algorithm


surf1.m
% make a surface plot


test2regress.m
% Test the formulas for regression in two dimensions
% input: x and y vectors


test2regress2.m
% Test the formulas for regression in two dimensions
% input: x and y vectors


testeigfil.m
% Test the eigenfilter stuff


testeigfil2.m
% Test the eigenfilter stuff


testeigfil3.m
% test the eigenfilter stuff


testexlms.m
% Test the lms in a system identification setting
% Assume a Gaussian input


testlms.m
% test the lms in an equalizer setting
% Assume a binary +/- 1 input.


testmusic.m
% Test the music algorithm


testnn1.m
% test the neural network stuff


testnn2.m
% test the neural network stuff
% (run testnn1.m first to get the network trained)
%
% does some plots after the initial training is finished


testnn3.m
% test the neural network stuff
% try different values of mu and alpha
% run testnn1 first to get the training data


testrls.m
% test the rls in an equalizer setting
% Assume a binary +/- 1 input.


testrls2.m
% test the rls in a system identification setting
% Assume a binary +/- 1 input.


testrls2ex.m
% test the rls in a system identification setting
% Assume a binary +/- 1 input.


testrlsex.m
% test the rls in an equalizer setting
% Assume a binary +/- 1 input.


testrot.m
% test the procrustes rotation


testtls.m
% Test tls stuff


vq1.m
% Generate random Gaussian data, determine a codebook for it, and plot


wftestcont.m
% make the contour plot for wftest


***************************************************************
Directory: solutions
***************************************************************
ator2.m
% 
% Given the coefficients from a 2nd-order AR model
% y[t+2] + a1 y[t+1] + a2 y[t] = f[t+2],
% where f has variance sigmaf2, compute sigma_y^2, r[1], and r[2].
% 
% function [sigma2,r1,r2] = ator2(a1,a2,sigmaf2)
%
% a1, a2 -- AR model coefficients
% sigmaf2 -- input noise variance
%
% sigma2 -- output noise variance
% r1, r2 -- covariance values


backdyn.m
%
% Backward dynamic programming
%
% function [pathlist,cost] = backdyn(H,W)
%
% H = graph
% W = costs
%
% pathlist = list of paths
% cost = cost of paths


backsub.m
% 
% solve Ux = b, where U is upper triangular
%
% function x = backsub(U,b)
% U = upper triangular matrix
% b = right and side
%
% x = solution


bayesest1.m
% Example of non-Gaussian Bayes estimate


correst.m
% 
% Estimate the autocorrelation function
% the returned values are offset (by Matlab requirements) so that
% r(1) = r[0], etc.
% Only correlations for positive lags are returned.  For other values,
% use the fact that r[k] = conj(r[-k])
%
% function r = correst(x)
%
% x = data sequence
%
% r = estimated correlations


fcm.m
%
% Find k clusters on the data X using fuzzy clustering
% function [Y,d] = fcm(X,m)
%
% X = input data: each column is a training data vector
% m = number of clusters to find
%
% Y = set of clusters: each column is a cluster centroid
% U = membership functions


findperm.m
% 
% Determine a permutation P such that Px = z (as close as possible)
% using a composite mapping
%
% function P = findperm(x,z,maxiter)
%
% x = input data (to be permuted)
% z = permuted data
% maxiter = optional argument on number of iterations
%
% P is an index listing, so the permutation is obtained by x(P) = z.


forbacksub.m
% 
% Solve Ax = b, where A has been factored as PA = LU
%
% function [x] = forbacksub(b,LUin,indx)


forbacksubround.m
% 
% Solve Ax = b, where A has been factored as PA = LU
% using digits places after the decimal point.
%
% function [x] = forbacksubround(b,LUin,indx,digits)
%
% b = right hand side
% LUin = LUfactorization (from newlu)
% indx = pivot index list (from newlu)
% digits = number of digits to retain
%
% x = solution


forsub.m
% 
% Solve Lx = b, where L is lower triangular
% %
% function x = forsub(L,b)
%
% L = lower triangular matrix
% b = right-hand side
%
% x = solution


getulu.m
% 
% Return the L and U matrix from the LU factorization computed by newlu
%
% function [L,U] = getulu(luin,indx)
%
% luin = lu matrix from newlu
% index = pivot index from newlu
%
% L = lower triangle
% U = upper triangle


gramschmidt2.m
% 
% Modified Gram-Schmidt: Compute the Gram-Schmidt orthogonalization of the 
% columns of A, A = QR
%
% function [Q,R] = gramschmidt2(A)
%
% A = matrix to be factored
%
% Q = orthogonal matrix
% R = upper triangular matrix


gramschmidtW.m
% 
% Compute the Gram-Schmidt orthogonalization of the 
% columns of A with the inner product <x,y> = x'*W*y
% W should be symmetric
% 
% function [Q,R] = gramschmidtW(A,W)
%
% A = matrix to be factored
% W = weighting matrix
%
% Q = orthogonal matrix
% R = upper triangular matrix


gs.m
% 
% Gram-Schmidt using symbolic toolbox
%
% function q = gs(P,a,b,w,t)
%
% P = list of functions in P(1), P(2), ...
% a = lower limit of integration
% b = upper limit of integration
% w = weight function
% t = variable of integration
%
% q = array of orthogonal functions


gs.mma
(* A Gram-Schmidt procedure *)


ifs1.m
% test some ifs stuff


mgs.m
% 
% Compute the Gram-Schmidt orthogonalization of the 
% columns of A, assuming nonzero columns of A
% using the modified Gram-Schmidt algorithm.  A = QR
% 
% function [Q,R] = mgs(A)
%
% A = matrix to be factored
%
% Q = orthogonal matrix
% R = upper triangular


newluround.m
% 
% Compute the lu factorization of A
% controlling the pivoting and the rounding
% dopivot = 1 if piviting desired
% digits = number of decimal places to retain in rounding (digits=3 for 3
% dec. digits)
%
% function [lu,indx] = newluround(A,dopivot,digits)
%
% A = matrix to factor
% dopivot = flag if pivoting desired
% digits = number of digits to retain
%
% lu = matrix containg L and U factors
% indx = index of pivot permutations


newprony.m
% 
% Prony's method: Given a sequence of supposedly sinusoidal data with p
% modes, determine the  vector a of characteristic equation coefficients and
% modes --- the roots of the characteristic polynomial 
%
% function [a,r] = newprony(x,p)
% 
% x = sinusoidal data vector
% p = number of modes
%
% a = characteristic polynomial 
% r = roots of the characteristic polynomial


plotellipse.m
% 
% Determine the points to plot an ellispe in two dimensions, 
% described by (x-x0)'*A*(x-x0) = c, where A is symmetric
%
%  function [x] = plotellipse(A,x0,c)
%
% A = symmetric matrix describing ellipse
% x0 = center point
% c = constant
%
% x = 2 x n list of data points


plotlfsrautoc.m
% plot the autocorrelation of the output of an LFSR


rdigits.m
% 
% round the input to digits places
%
% function x = rdigits(y,digits)
%
% y = input value
% digits = number of digits
%
% x = rounded value


speceig.m
% Set up a matrix with specified eigenvalue strucure


speceig1.m
% Construct a matrix with given eigenspace structure


speceig2.m
% Construct a matrix with given eigenspace structure


wrls.m
% 
% Given a scalar input signal x and a desired scalar signal d,
% compute an RLS update of the weight vector h.
% eap is an optional return parameter, the a-priori estimation error
% This function must be initialized by wrlsinit
%
% function [h,eap] = wrls(x,d)
%
% x = scalar input
% d = desired value
%
% h = filter coefficient vector
% eap = a priori estimation error


wrlsinit.m
% 
% Initialize the weighted RLS filter
%
% function rlsinit(m,delta)
%
% m = dimension of vector
% delta = a small positive constant used for initial correlation inverse
% lambdain = value of lambda to use for decay factor


***************************************************************
Directory: testers
***************************************************************
arttest.m
% test the ART algorithm


bliter.m
%
% test reconstruction of bandlimited function


conjgradtest.m
% Test the conjugate gradient algorithm


dijtest.m
% Test Sisjstras and Warshall's algorithms


givens1.m
% test a Givens matrix


hmmtest.m
% Test data for the HMM


hmmtest2.m
% Test data for the HMM


hmmtest21.m


hmmtest22.m


hmmtest23.m


hmmtest24.m
% axis([1 4 -25 -5])


hmmtest2v.m
% Test the HMM using both Viterbi and EM-algorithm based training methods
%  the file hmmtest2vb.m contains identical results, but without the
%  plotting instructions at the end.  


hmmvit.m
% test the HMM stuff using the VA


houseW.m
% test the weighted Householder idea


lpfilttest.m
% test the linear programming filter design


testbackdyn.m
% test the forward dynamic programming algorithm


testeigcomp.m
% Test the eigencomputation routine


testfblp.m
% Test the fblp AR estimator


testfindperm.m
% Test the findperm program


testfordyn.m
% Test the forward dynamic programming algorithm


testkarmarker.m
% testkarmarker.m: Test the Karmarker linear programming solution


testmarv.m
% Test the Prony's method in marv.m


testmassey.m
% a sequence with a linear complexity of 5


testmassey2.m
% Test the routines to find lfsrs for data compression


testpolydiv.m
% test the polynomial division stuff


testprim5.m
% generate elements in GF(5^2) using p(x) = x^2 + x+2


testprony.m
% Test the prony method


vit2test.m
% Test and plot the results of the viterbi algorithm


vittest.m
% 
% Test and plot the results of the viterbi
%
% function vittest()


vittest1.m
% demonstrate the VA


vittest2.m
%
% Test and plot the results of the viterbi
%
%  function vittest()


vittest3.m
%
% Ttest and plot the results of the viterbi
% 
% function vittest()


vittest4.m
% Test and plot the results of the viterbi


vittest5.m
% 
% Test and plot the results of the viterbi
% 
% function vittest()


wavetest2.m
% Test some computations for wavelet transforms (matrix-based)


wftest2.m
% test the Wiener filter equalizer stuff for a first-order signal and
% first-order channel


