function L = tri_decode(val)
    L = [];
    L(1) = fix(fix(val/3)/3);
    L(2) = mod(fix(val/3),3);
    L(3) = mod(val,3);
end