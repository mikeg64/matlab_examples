% TUTORIAL 1.                               By Deniz Savas, February 2016
% This script demonstrates reading data into MATLAB from well constructed
% text files.
% PERFORM THE FOLLOWING TASKS:
% TASK 1 - edit trend.txt  ( by double clicking on it in matlab folder to view )
%    to see what it contains.
%                  
% It is possible to read well constracted data files such as trend.txt
% into matlab by using the LOAD command.
% type:  DOC LOAD   and investigate help on using the LOAD command.
%  TASK 2- Read in this trend.txt into MATLAB using the LOAD command.
%
%  TASK 3 -Save each column as a seperate variable by using vector
%           assignments calling them Y1  and Y2 
%  TASK 4: Plot Y1  using the PLOT command.
%
% TASK 5 : Use the import data wizard to read this same data. 
% 
% TASK 6 : Dealing with missing values :
% It is not uncommon to be presented with set of observations where 
% some of the observations have missing values. 
% This fact is usually recorded in the datafile either by
%   - leaving the containing cell blank  
%  - or by coding some unlikely number such as 99999 to indicate that the
%  observation at this point has not been recorded. 
% The datafile trendmiss.txt is one such example datafile where
% observations have been left blank.
% Your task is to read this file via the import wizard, observe how the
% missing entries are stored and eliminate those records which contain the
% missing values during further analysis.
% 6.1 Read trendmiss.txt via import wizard and keep missing values as NaN 
%      and plot these two columns.
%     
% 6.2 Find indices of first and second columns where observations are
%     missing.
%     HINT1: Use function isnan.
%            For example indx =isnan(x) returns an array of same size as the
%            x array which contains  (1) for elements that corresponds 
%            to NaN and (0) otherwise.
%     If missing values were coded as say 999, then, x( x~= 999 ) 
%      will return a vector that contains only non missing elements. 
%     You can also use the FIND function. For example
%      inx= find( x ~= 999 ) ; x=x(inx) ; 
% 6.3 Find the indices or the rows where either of the columns is missing.
%     HINT2: If we have two vector of same lenght indx  and indy, which
%           contain 1's and 0's, then  indx | indy returns an array of same
%           lenght which contain the logical OR'ing of indx and indy  
%     HINT3: The ~ ( NOT ) operator can be applied to logical arrays 
%            to turn all TRUE(1) elements to FALSE(0) and all FALSE(0)
%            elements to TRUE(1) 
% 6.4 Eliminate the rows containing missing value(s). 
%     HINT4: Finally given a vector x that contains data and a vector 
%            indx  that contains 1s and 0s, the expression x(indx) returns
%            a new vector that contain only the elements of x which
%            correspond to non-zero elements of indx . 
% 6.5 Plot the data after elliminating missing observations.
% FURTHER EXAMPLES:   See the Excel Spreadsheat ( electricity.xls ) 
% Use Import Data icon to read it in. 