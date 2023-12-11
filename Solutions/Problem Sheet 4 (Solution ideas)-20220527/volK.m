a=1;b=2;c=3;
N=input('Enter an integer: ');
X= rand( N , 3 ) ;
T1=X(: ,1).^2+X(: ,2).^2+X(: ,3).^2 -1; Nk=nnz(T1<= 0);
disp ( ' Approximation of volume of K: ' ) 
vol_k=8*a*b*c*Nk/N
disp ( ' Approximation of pi : ' ) 
a*b*c*Nk/N