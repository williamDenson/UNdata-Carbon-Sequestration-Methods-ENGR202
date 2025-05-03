% ENGR202 Project - Carbon Sequestration Methods
% NAE Challenge
% Members:
% Valerie Swafford
% William Denson
% The aim of this MATLAB script is to document and graph data collected by
% UNdata regarding atmospheric contaminants and how they may be reduced.

clc
clear all

Year = xlsread('UNdata_Export_20250503_165309045.xlsx','B1345:B1376');

CarbonLevel = xlsread('UNdata_Export_20250503_165309045.xlsx','C1345:C1376');

% Future if then conditional code will divide up country names


% The following will consist of graphing functions using the 'bar' command
% Year range values will bechanged within the parameter set to fix a unique XData
% error
figure(1)
bar(Year,CarbonLevel); hold on;

