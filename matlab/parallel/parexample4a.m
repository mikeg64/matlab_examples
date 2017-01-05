% PMODE practical examples  
% 
%
%% Starting up PMODE Parallel Command Windows
% Start up the parallel interactive mode which uses the
% local profile with only four workers in the pool.
% ANSWER:Type   pmode('start' , 'local' , 4 ) on the initial 
%        MATLAB window (i.e. Client Window )  
% 
%% Generate a 5by5 pascal matrix in the Client Window
% ANSWER:  Type  p = pascal(5)   on the client window.

%% Transfer the pascal matrix to client 1.
% ANSWER:  Type  pmode client2lab p 1 
% Now find out what variables are stored on the workers
% ANSWER:  Type  who  on the parallel command window.
%  You should observe that the matrix p is only on worker-1. 

%% Transfer matrix p from the client to all the workers.
% ANSWER: Type pmode client2lab p 1:4 

%% On each worker create a matrix called t which is p*labindex
% ANSWER:  On the parallel command window type  t= p*labindex

%% Try to transfer matrix t from worker 2 to the client.
% ANSWER : On client or parallel window type   pmode lab2client t 2 
% Now send matrix t from worker 3 to client.
% What has happened to t on the client workspace ? Explain

%% Try to find a way of sending t from each worker to the client which
%   will not overwrite what is already on the client. 
% ANSWER:  pmode lab2client and pmode client2lab commands can take an 
%          extra parameter as the name of the variable in the destination.
%          For example:  pmode lab2client t 3 t3   will copy t from 
%          worker-3 into a matrix named t3 in the client's workspace 

%  NEXT:   perform parexample4b that automates what is described above. 

 