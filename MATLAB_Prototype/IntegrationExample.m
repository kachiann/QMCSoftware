%% How to integrate a function using our community QMC framework
% An example with Keister's function integrated with respect to the uniform
% distribution over the unit cube
stopObj = CLTStopping %stopping criterion for IID sampling using the Central Limit Theorem
distribObj = IIDDistribution; %IID sampling
distribObj.trueDistribution = 'stdGaussian'; %with Gaussian distribution
[sol, out] = integrate(KeisterFun, distribObj, stopObj)
stopObj.absTol = 1e-3 %decrease tolerance
[sol, out] = integrate(KeisterFun, distribObj, stopObj)
stopObj.absTol = 0; %impossible tolerance
stopObj.nMax = 1e6; %calculation limited by sample budget
[sol, out] = integrate(KeisterFun, distribObj, stopObj)

%A multilevel example of Asian option pricing
stopObj.absTol = 0.01; %increase tolerance
stopObj.nMax = 1e8; %pushing the sample budget back up
OptionObj = AsianCallFun(4) %4 time steps
[sol, out] = integrate(OptionObj, distribObj, stopObj)

OptionObj = AsianCallFun(64) %single level, 64 time steps
[sol, out] = integrate(OptionObj, distribObj, stopObj)

OptionObj = AsianCallFun([4 4 4]) %multilevel, 64 time steps, faster
[sol, out] = integrate(OptionObj, distribObj, stopObj)
