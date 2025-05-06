% ENGR202 Project - Carbon Sequestration Methods
% NAE Challenge
% Members:
% Valerie Swafford
% William Denson
% The aim of this MATLAB script is to document and graph data collected by
% UNdata regarding atmospheric contaminants and how they may be reduced.

clc
clear all

YearCarbon = xlsread('UNdata_Export_20250503_165309045.xlsx','B1345:B1375');

UnitedStates = xlsread('UNdata_Export_20250503_165309045.xlsx','C1345:C1375');
Australia = xlsread('UNdata_Export_20250503_165309045.xlsx','C2:C32');
Canada = xlsread('UNdata_Export_20250503_165309045.xlsx','C161:C191');
Russia = xlsread('UNdata_Export_20250503_165309045.xlsx','C1057:C1087');

CountriesCarbon = [UnitedStates Australia Canada Russia];


% Future if then conditional code will divide up country names, or assign color coding, or display a message
% if the carbon amount surpasses a certain threshold


% The following will consist of graphing functions using the 'bar' command
% Year range values will bechanged within the parameter set to fix a unique XData
% error

% The United States (blue) shows considerable consumption and generation of
% carbon compared to Canada and Australia
figure(1)
bar(YearCarbon,CountriesCarbon)
xlabel('Time(s)');
ylabel('kilotonne');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

YearGreenhouse = xlsread('UNdata_Export_20250503_202706877.xlsx','B2:B32');

Bulgaria = xlsread('UNdata_Export_20250503_202706877.xlsx','C2:C32');
Cyprus = xlsread('UNdata_Export_20250503_202706877.xlsx','C34:C64');
Czechia = xlsread('UNdata_Export_20250503_202706877.xlsx','C66:C96');
Finland = xlsread('UNdata_Export_20250503_202706877.xlsx','C162:C192');

CountriesGreenhouse = [Bulgaria Cyprus Czechia Finland];

% bar(YearGreenhouse,CountriesGreenhouse)
% xlabel('Time(s)');
% ylabel('kilotonne');

% This plot shows considerable variation in greenhouse gases from the
% UNdata set. The gas profile presented does not include general forestry
% and land use. The following acronyms were used for the heading of the
% UNdata set: "Greenhouse Gas (GHGs) Emissions, including Indirect CO2,
% without LULUCF..."
figure(2)
plot(YearGreenhouse,CountriesGreenhouse)
