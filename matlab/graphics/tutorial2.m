% TUTORIAL 2                                 By Deniz Savas, February 2016
% This script demonstrates reading data into MATLAB from data files
% that may contain other information such as variable names and comments.
% PERFORM THE FOLLOWING TASKS:
%  TASK 1  - Edit file trendtable.txt to observe it's lay out.
%  TASK 2  - Later one we will use the DATASTORE command to read the data 
%            contained in trendtable.txt by using the DATASTORE command.
%          Type : DOC DATASTORE   to read help on this command. 

%%
% TASK 3 : The following section contains a set of commands that define
%          the data layout in 'trendtable.txt' for reading into MATLAB. 
%          Due to the comment lines in the data file that start with ***
%          we are unable to read the two vectors of numbers as floating
%          numbers. Your task is to set the CommentStyle property of the
%          datastore to correct this problem.
%          HINTS:  PREVIEW command checks reading of the data.
%                  READ command  reads in the data.
%                  RESET command rewinds the datafile to be read again.
%          
%%
ds=datastore('trendtable.txt' ) ;
ds.NumHeaderLines=3;
ds.Delimiter='\t' ;
ds.ReadVariableNames=true;
%  add a command here to specify the comment lines in the data to ignore.

% use the PREVIEW command to review what the data will look like when read.
% use the READ command to read the data. (e.g.  t=read(ds) 


%%  At this point you will have a variable of type TABLE.
% TASK 4:
%Extract the contents of variable named Population from the table variable 
% into an array called y1
%Extract the contents of variable named Prey from the table variable 
% into an array called y2
%Constract a 2 column matrix containing y1 and y2 by uncommenting next line 
% Y= [y1 , y2 ] 

%% TASK 5:
%   Plot the Y matrix .
%   Plot Y' matrix to see what happens.


