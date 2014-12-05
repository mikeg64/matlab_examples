%updated by Mitra 5th December 2014 


%poolSize = 4;
%matlabpool(poolSize);
%matlabpool is replaced witj parpool in the new version
%MIT parpool open 4
parpool('sge',4)
%poolobj = parpool;

nsims=50;
in=rand(2,nsims);

%distributed arrays are changed to codistributed arrays in this release 

%tmpresults=zeros(1,nsims,distributor());
tmpresults=zeros(1,nsims,codistributor());

parfor lp=1:nsims
   tmpresults(lp)=iRosenbrock(in(:,lp)); 
end
results=gather(tmpresults,1);

%MIT parpool close
% delete(poolobj)
delete(gcp)