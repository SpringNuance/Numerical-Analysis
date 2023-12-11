m = 3;
n = 7;

X=(0:1/m:1)' * pi;
Y=(0:1/n:1)' * 2 * pi;
[YY,XX ]=meshgrid(Y,X);
ZZ =f (XX,YY);
U= ( 0: 0.02: 1 )' * pi;
V= ( 0: 0.02: 1 )' * 2 * pi;
W1 =lagweights(X);
W2 =lagweights(Y);
% numerator
for p=1:length(X)
 S1(p,:)= specialsum (Y,W2 .* ZZ(p,:)',V);
end
for j =1:length(V)
 Suv (:,j)=specialsum (X,W1 .* S1(:,j),U)';
end
% denominator
SX =specialsum (X,W1,U);
SY =specialsum (Y,W2,V);
[SSX,SSY]=meshgrid(SX,SY);
Slag= Suv./(SSX .* SSY)';
subplot(121)
[VV,UU ]=meshgrid(V,U);
Sf=f (UU,VV);
surf(UU,VV,Sf )
title( 'The  function ' )
subplot(122)
surf(XX,YY,ZZ)
title( ' Sampled Data ' )
figure
subplot(121)
surf(UU,VV, Slag )
title( ' Interpolating  polynomial ' )
subplot(122)
surf(UU,VV, Slag-Sf )
title( ' Error ' )