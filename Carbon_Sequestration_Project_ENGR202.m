% ENGR202 Project - Carbon Sequestration Methods
% NAE Challenge
% Members:
% Valerie Swafford
% William Denson
% The aim of this MATLAB script is to document and graph data collected by
% UNdata regarding atmospheric contaminants and how they may be reduced.

clc
clear all

Year = xlsread('UNdata_Export_20250503_165309045.xlsx','B1345:B1375');

UnitedStates = xlsread('UNdata_Export_20250503_165309045.xlsx','C1345:C1375');
Australia = xlsread('UNdata_Export_20250503_165309045.xlsx','C2:C32');
Canada = xlsread('UNdata_Export_20250503_165309045.xlsx','C161:C191');

Countries = [UnitedStates Australia Canada];


% Future if then conditional code will divide up country names, or assign color coding, or display a message
% if the carbon amount surpasses a certain threshold


% The following will consist of graphing functions using the 'bar' command
% Year range values will bechanged within the parameter set to fix a unique XData
% error

% The United States (blue) shows considerable consumption and generation of
% carbon compared to Canada and Australia
bar(Year,Countries)
xlabel('Time(s)');
ylabel('kilotonne');
