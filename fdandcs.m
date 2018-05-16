% Change 3
clear; close all; clc

% a 1D function for simplicity
f = @(x) exp(x)*sin(x);

%  symbolic derivatives so we can compare performance
g = @(x) exp(x)*sin(x) + exp(x)*cos(x);

% let's take a bunch of different step sizes from very large to very small
n = 26;
step_size = logspace(0, -25, n);

% initialize results array
grad_fd = zeros(n, 1);  % forward diff
grad_cd = zeros(n, 1);  % central diff
grad_cs = zeros(n, 1);  % complex step

%  arbitrarily chosen point about which to take derivatives
x = 0.5;

actual = g(x)*ones(n,1);
error = zeros(n,1);
% --- finite difference ---
% Forward Difference
for i = 1:n
    grad_fd(i) = (f(x+step_size(i))-f(x))/step_size(i);
    error(i) = abs(actual(i)-grad_fd(i))/norm(actual);
end

% Central difference
for i = 1:n
    grad_cd(i) = (f(x+step_size(i))-f(x-step_size(i)))/(2*step_size(i));
    error(i) = abs(actual(i)-grad_cd(i))/norm(actual);
end

% --- complex step ---
image(X)


loglog(step_size,error)

