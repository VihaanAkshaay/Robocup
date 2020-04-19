function f = TfMatrix(a,al,t,d)

f = [cos(t),-sin(t),0,a;
    sin(t)*cos(al),cos(t)*cos(al),-sin(al),-d*sin(al);
    sin(t)*sin(al),cos(t)*sin(al),cos(al),d*cos(al);
    0,0,0,1;];

end