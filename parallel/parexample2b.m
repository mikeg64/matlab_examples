%
%  This example performs fourier series studies for analysing a wave-form
% We apply fast fourier transforms to a signal x(t) for various degrees of
% fast fourier series , in the sequence of increasing powers of 2.
% Each application is performed by using the parfeval function to pass the
% work to one of the workers. 
% 
t= 0.0:0.1:6.0 ;  % time interval is 0.0 to 6.0 


Fs = 1000;                    % Sampling frequency
T = 1/Fs;                     % Sample time
L = 1000;                     % Length of signal
t = (0:L-1)*T;                % Time vector

%% Prepare a sample signal with an artificial noise introduced to it
% We will then try to analyse this 'dirty' signal to recover the original
% signal by using Fourier Transforms. 
%
% Pure signal is the sum of a 50 Hz sinusoid and a 120 Hz sinusoid wave.
   X = 0.7*sin(2*pi*50*t) + sin(2*pi*120*t); 
% 
% For demonstration purposes let us make it noisy by adding to it a random
% signal.
% The random signal is normally distributed around 0.0 with amplitude=0.5 
   noise = 0.5*randn( size(t) ) ; 
   xdirty = X + noise;     % Sinusoids plus noise

%%  plot the polluted signal.. 
h1= plot(Fs*t(1:50),xdirty(1:50) ); 
title('Signal Corrupted with Zero-Mean Random Noise')
xlabel('time (milliseconds)')


%% preliminaries 
powfft = nextpow2(L) ; % Next power of 2 from length of pure signal x.
%
Y = zeros(1,2^powfft ) ; % pre allocate Y vector for efficiency reasons...

% 
%% Serial Execution :

for ii = 3:powfft 
    NFFT = 2^ii;
    Y= myfourier( xdirty , L , Fs, NFFT ) ;
    
end

%
%% An equivalent parallel execution : 
 
 pool= gcp();  %   start the parallel pool 
 
% parallel evaluate myfourier function 
% each parfeval invocation returns a different FFT ( Fast Fourier) series.
%  defined by  2^ii terms in the series. We start with 2^3 i.e. 8 terms in
%  the series.
% 
%  Each invocation returns a different parallel-evaluation handle RES
%
 for ii = 3:powfft 
     NFFT = 2^ii;
     RES(ii-2) = parfeval(  pool , @myfourier ,1 , xdirty , L , Fs , NFFT ) ;
 end
%  Now we can recover the results by using the handles in RES as input to
%  the fetchNext function. 
% The difference between using fetchOutputs and fetchNext is that
% fetchOutputs will wait for all the tasks to be completed whereas 
% fetchNext will return as soon as any one of the remaining tasks is 
% completed thus saving otherwise idle waiting time. 
% As we don't normally know which of the tasks will finish next the index 
% of the finished task is also returned as the first output parameter from
% a fetchNext call. 
%  
%  There is no guarantee that the results will be returned in the same
%  sequence as the parfeval calls are made and that is why we need the
%  idcomplete index. 

%%  Fetch results one at a time using the fetchNext function
% 
 yresult=cell(1,powfft-2) ; % pre allocate for efficiency.
 for ii = 3:powfft
     [ idcomplete , aresult ] = fetchNext( RES ) ;
     fprintf('Received result for index: %d.\n', idcomplete);
      yresult{idcomplete} = aresult ;
 end
  
 %% Finally plot the results
 hf= figure ; % start a new figure and save its handle.
 for ii = 3:powfft 
     Y = yresult{ii-2} ; 
     NFFT = 2^ii;
   
% Plot single-sided amplitude spectrum.
%
    figure(hf)  % make sure it is plotted in the second figure window.
    f = Fs/2*linspace(0,1,NFFT/2+1);
    plot(f,2*abs(Y(1:NFFT/2+1)))   
    nffc = num2str(NFFT );
    title([ 'Single-Sided Amplitude Spectrum of y(t) using ' nffc ' terms' ])
    xlabel('Frequency (Hz)')
    ylabel('|Y(f)|')
    pause( 2 ) ;
end
 close(hf) ; % close the figure 
