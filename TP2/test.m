options = optimset('Display','iter','MaxFunEvals',500,'TolX',1.0000e-8,'TolFun',1.000000e-8);
%[xmin,fmin,exitflag,output]=fminunc('ackley',[-1 1],options)
[xmin,fmin,exitflag,output]=fminsearch('ackley',[-0.001 0.001],options)
