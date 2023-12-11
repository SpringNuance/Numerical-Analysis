function C=quadhermite(a,b,z,y1,y2,s1,s2)
h1=z-a;h2=b-z;
C=[y1,y1+h1*s1/2,...
(h1*y2+h2*y1-h1*h2*(s2-s1)/2)/(h1+h2),y2-h2*s2/2,y2]';
end