%% 

function S = my_classifier(im, net)


    YPred = classify(net,im);
    S = tri_decode(str2num(string(YPred)));
end

