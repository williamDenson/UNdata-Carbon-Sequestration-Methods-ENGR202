% ENGR202 Project - Carbon Sequestration Methods
% NAE Challenge
% Members:
% Valerie Swafford
% William Denson
% The aim of this MATLAB script is to document and graph data collected by
% UNdata regarding atmospheric contaminants and how they may be reduced.

clc
clear all

Year = xlsread('UNdata_Export_20250503_165309045.xlsx','B2:B1990');

CarbonLevel = xlsread('UNdata_Export_20250503_165309045.xlsx','C2:C1990');

figure(1)
plot(Year,CarbonLevel,'ro'); hold on;

