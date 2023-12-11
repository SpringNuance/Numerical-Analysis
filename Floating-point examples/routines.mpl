read "float.mpl";

RN := (x)->nearest_binary32(x):

Fast2Sum := proc(a, b)
    local s,z,t;

    s:=RN(a+b);
    z:=RN(s-a);
    t:=RN(b-z);

    [s,t]
end proc:

Safe2Sum := proc(a, b)
    local s,a1,b1,da,db,t;

    s:=RN(a+b);
    a1:=RN(s-b);
    b1:=RN(s-a1);
    da:=RN(a-a1);
    db:=RN(b-b1);
    t:=RN(da+db);

    [s,t]
end proc:

Fast2MultFMA := proc(a,b)
    local p,r;
    p:=RN(a*b);
    r:=RN(a*b-p);

    [p,r]
end proc:

KahanP2x2Det := proc(a,b,c,d)
    local w,e,f;
    w:=RN(b*c);
    e:=RN(w-b*c);
    f:=RN(a*d-w);
    RN(f+e)
end proc: