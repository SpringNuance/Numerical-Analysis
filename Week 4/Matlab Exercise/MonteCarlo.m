clc;
format long
a = 1; b = 2; c = 3;
volC = 8*a*b*c;
N = input("Enter the number of uniformly distributed points: ");
X = rand(N,3).*2 - 1 ;
[numPoints, vectorSize] = size(X);
countInsideSphere = 0;
lie_inside_sphere = @(u, v, w) u^2 + v ^2 + w^2 <= 1;
for i=1:numPoints
    point = X(i,:);
    if lie_inside_sphere(point(1),point(2),point(3))
        countInsideSphere = countInsideSphere + 1;
    end
end
disp("Number of uniformly generated points inside the cube of side 2: " + numPoints);
disp("Number of points inside the unit sphere: " + countInsideSphere);
ratio = countInsideSphere/numPoints;
disp("The ratio of '(4/3pi)/8'(0.523599) approximated by the Monte Carlo method: " + ratio);
volKtrue = volC * (4/3 * pi)/8;
disp("True volume of ellipsoid K: " + volKtrue)
volKapprox = volC * ratio;
disp("Approximated volume of ellipsoid K by Monte Carlo method: " + volKapprox)
piApprox = ratio*8/(4/3);
disp("Approximation of pi: " + piApprox)
