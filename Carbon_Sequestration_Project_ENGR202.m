% ENGR202 Project - Carbon Sequestration Methods
% NAE Challenge
% Members:
% Valerie Swafford
% William Denson
% The aim of this MATLAB script is to document and graph data collected by
% UNdata regarding atmospheric contaminants and how they may be reduced.
% A series of questions will ask a user to enter threshold amounts of air
% born pollutants and the MATLAB script will index applicable data columns
% to determine if a country has exceeded its threshold amounts and whether
% further sequestration methods are needed. 

clc
clear all

% X-axis of graph consists of the time variable, year
YearCarbon = xlsread('UNdata_Export_20250503_165309045.xlsx','B1345:B1375');

% A control group of 4 countries are selected and data is extraced from
% excel files using the xlsread command
UnitedStates = xlsread('UNdata_Export_20250503_165309045.xlsx','C1345:C1375');
Australia = xlsread('UNdata_Export_20250503_165309045.xlsx','C2:C32');
Canada = xlsread('UNdata_Export_20250503_165309045.xlsx','C161:C191');
Russia = xlsread('UNdata_Export_20250503_165309045.xlsx','C1057:C1087');

% All countries concatenated into a sequential y-axis array
CountriesCarbon = [UnitedStates Australia Canada Russia];

% Designator/variable for passing in functions below
countryInQuesiton = UnitedStates;

% The following will consist of graphing functions using the 'bar' command
% Year range values will bechanged within the parameter set to fix a unique XData
% error


% Two output variable syntax returns max value of the United States and the
% array location
[xMAx,idx] = max(countryInQuesiton)

% User input for determining a threshold in carbon quotas simulating
% government regulatoin such as monitoring form the EPA
y1 = input('Enter a threshold amount in millions e.g. 6000000: ');

% Variable for keeping track how many violations have been performed
thresholdViolation = 0;

% for loop iterates from 1 to the numerical output of the size() function
% command that passes in 'countryInQuestion'
for i=1:size(countryInQuesiton)

    % A threshold of 6 million kilotonnes is used as a reference for
    % determining if a threshold is met
    if countryInQuesiton(i) > y1 % threshold input

        % If a threshold is met, the variable is incremented
        thresholdViolation = thresholdViolation + 1;

    end
end

% Dynamic printing that passes in several variables
fprintf('The number of times the United States exceeded the threshold of %i units of carbon dioxide is %i times\n',y1,thresholdViolation)

% figure 1 for the first type of data chart
figure(1)

% "stacked" parameter for "Each section in the stack corresponds to an
% element of y" - Reference: MATLAB Mathworks ref:bar using double quotes

h = bar(CountriesCarbon,'stacked');
set(h(1),'DisplayName','UnitedStates');
set(h(2),'DisplayName','Russia');
set(h(3),'DisplayName','Canada');
set(h(4),'DisplayName','Australia');

% The United States (blue) shows considerable consumption and generation of
% carbon compared to Canada and Australias
legend();

% Appropriate labels
xlabel('Time(Decades)');
ylabel('kilotonne');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Greenhouse gas data:

% X-axis of graph consists of the time variable, year
YearGreenhouse = xlsread('UNdata_Export_20250503_202706877.xlsx','B2:B32');

% Data extrapolation from Excel
Bulgaria = xlsread('UNdata_Export_20250503_202706877.xlsx','C2:C32');
Cyprus = xlsread('UNdata_Export_20250503_202706877.xlsx','C34:C64');
Czechia = xlsread('UNdata_Export_20250503_202706877.xlsx','C66:C96');
Finland = xlsread('UNdata_Export_20250503_202706877.xlsx','C162:C192');

% Concatenated y-axis index of countries
CountriesGreenhouse = [Bulgaria Cyprus Czechia Finland];

% Variable name 'countryEvaluation' to distinguish from carbon dioxide
% sequestration variables
countryEvaluation = Bulgaria;

% Two output variable syntax  returns max value of Bulgaria and the array
% location
% Information will be used for conditional comparison in the for loop and
% the if conditional statement
[xMAxGreenhouse,idxGreenhouse] = max(countryEvaluation);

% Input statement
y2 = input('Enter a threshold amount in tens of thousands e.g. 80000: ');

% Variable tracker for violations
thresholdViolationGas = 0;

% This for loop shows the volumetric and cubic amounts of greenhouse gases
% (GHGs), in kilotonnes, of a smaller country Bulgaria. The UN Data
% obtained for these results shows how a smaller country produces less
% greenhouse emissions than a larger country, the United States. Although
% the x and y graph, shown as a plot, show lower pollution metrics, a
% country may still constrict pollution outputs if a certain threshold is
% met. 
for a=1:size(countryEvaluation)

    % A threshold is established and compared
    if countryEvaluation(a) > y2 % threshold input

        % Increment if violation is exceeded
        thresholdViolationGas = thresholdViolationGas + 1;

    end
end

% Dynamic output statement with two variables passed in 
fprintf('The number of times Bulgaria exceeded the threshold of %i units of GHGs is %i times\n',y2,thresholdViolationGas)

% This plot shows considerable variation in greenhouse gases from the
% UNdata set. The gas profile presented does not include general forestry
% and land use. The following acronyms were used for the heading of the
% UNdata set: "Greenhouse Gas (GHGs) Emissions, including Indirect CO2,
% without LULUCF..."
figure(2)
% Plotting accomplished with set line widths and styles
plot(YearGreenhouse,CountriesGreenhouse,LineWidth=3,LineStyle="-")

% Legend command to showcase data
legend('Finland','Bulgaria','Czechia','Cyprus')

% Appropriate labels
xlabel('Time(year)');
ylabel('kilotonne');

% The nearest interpolation graphic method shows that the four European
% countries in question have a negative sloping trend in sequestering
% greenhouse gases
figure(3)

% Indexing range
unitYear = 1991:1:2021;

% Interpolate variable is assigned the interp1 command with applicaple
% pass-ins
interpolate = interp1(YearGreenhouse,CountriesGreenhouse,unitYear,'nearest');

% Data plotted and title assigned
plot(YearGreenhouse,CountriesGreenhouse,'o',unitYear,interpolate,':.');
title('Nearest Interpolation - Trends');
xlabel('Time(year)');
ylabel('kilotonne');
