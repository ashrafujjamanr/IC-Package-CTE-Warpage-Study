%% Thermal Expansion & CTE Mismatch Study in IC Packaging
% Author: Your Name
% Description:
% Models thermal expansion behavior of silicon, substrate, and mold
% material across temperature range and analyzes strain mismatch
% leading to package warpage risk.

clear; clc; close all;

%% Material Properties (CTE in ppm/C)
materials = { ...
    'Silicon Die',        2.6;  ...
    'BT Resin Substrate', 17.0; ...
    'Mold Compound',      20.0; ...
};

L = 10e-3; % Package length (10 mm -> meters)

%% Temperature Range
T_ref = 25;                 % Reference temperature (C)
T = -40:5:125;              % Temperature sweep (C)
dT = T - T_ref;             % ΔT relative to reference

%% Compute Expansion
expansion = zeros(length(materials), length(T));

for i = 1:length(materials)
    cte = materials{i,2} * 1e-6; % Convert ppm/C -> 1/C
    expansion(i,:) = L .* cte .* dT;
end

%% Select Silicon as Reference Layer
silicon_exp = expansion(1,:);
strain_diff = expansion - silicon_exp;

%% --------- PLOTS ---------

%% Plot 1: Absolute Expansion vs Temperature
figure;
plot(T, expansion(1,:), 'LineWidth', 2); hold on;
plot(T, expansion(2,:), 'LineWidth', 2);
plot(T, expansion(3,:), 'LineWidth', 2);
grid on;
xlabel('Temperature (°C)');
ylabel('Expansion (meters)');
title('Thermal Expansion of Packaging Materials');
legend(materials(:,1), 'Location', 'northwest');

%% Plot 2: Strain Difference vs Temperature (Warpage Driver)
figure;
plot(T, strain_diff(2,:), 'LineWidth', 2); hold on;
plot(T, strain_diff(3,:), 'LineWidth', 2);
grid on;
xlabel('Temperature (°C)');
ylabel('Strain Difference relative to Silicon (meters)');
title('CTE Mismatch / Strain Difference vs Temperature');
legend('Substrate vs Silicon','Mold vs Silicon','Location','northwest');

%% Save Data & Figures
outputDir = "results";
if ~exist(outputDir, "dir")
    mkdir(outputDir);
end

writematrix([T' expansion'], "results/cte_expansion_data.csv");
saveas(1, "results/expansion_plot.png");
saveas(2, "results/strain_difference_plot.png");

disp("Simulation complete. Results saved in /results folder.");
