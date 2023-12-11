function hermiteQuadCoeff = quadhermite(a, b, z, y1, y2, s1, s2)
    c10 = y1;
    c22 = y2;
    d = 2;
    hSpline1 = z - a;
    hSpline2 = b - z;
    derivativeA = s1; 
    derivativeB = s2;
    c11 = (derivativeA * hSpline1 / d) + c10;
    c21 = c22 - (derivativeB * hSpline2 / d);
    c120 = (hSpline1 * c21 + hSpline2 * c11)/(hSpline1 + hSpline2);
    hermiteQuadCoeff = [c10, c11, c120, c21, c22];
end

