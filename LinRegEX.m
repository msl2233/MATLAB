% Generate synthetic data for illustration
rng(42); 
num_samples = 100;
cement = randi([200, 400], num_samples, 1);
water_cement_ratio = rand([num_samples, 1]) * 0.3 + 0.4;
curing_time = randi([7, 28], num_samples, 1);

% Simulate the linear relationship with some noise
compressive_strength = 30 * cement + 20 * water_cement_ratio + 5 * curing_time + normrnd(0, 10, [num_samples, 1]);

data = table(cement, water_cement_ratio, curing_time, compressive_strength, 'VariableNames', {'Cement', 'WaterCementRatio', 'CuringTime', 'CompressiveStrength'});

% Use linear regression to predict compressive strength
X_cement = [ones(num_samples, 1), data.Cement];
X_water_ratio = [ones(num_samples, 1), data.WaterCementRatio];

y = data.CompressiveStrength;

% Fit the linear regression models
b_cement = regress(y, X_cement);
b_water_ratio = regress(y, X_water_ratio);

% Make predictions on the original data
y_pred_cement = X_cement * b_cement;
y_pred_water_ratio = X_water_ratio * b_water_ratio;

%3d plot
figure;
scatter3(data.Cement, data.WaterCementRatio, data.CompressiveStrength, 'b', 'filled');
xlabel('Cement');
ylabel('Water-Cement Ratio');
zlabel('Compressive Strength');
title('3D Scatter Plot: Cement, Water-Cement Ratio, and Compressive Strength');

% cement plot
figure;
scatter(data.Cement, data.CompressiveStrength, 'b', 'filled');
hold on;
plot(data.Cement, y_pred_cement, 'r-', 'LineWidth', 2);
hold off;
xlabel('Cement');
ylabel('Compressive Strength');
legend('Actual Data', 'Linear Regression Fit (Cement)');
title('Linear Regression: Predicted vs. Actual Compressive Strength (Cement)');

% water cement ratio plot 
figure;
scatter(data.WaterCementRatio, data.CompressiveStrength, 'b', 'filled');
hold on;
plot(data.WaterCementRatio, y_pred_water_ratio, 'r-', 'LineWidth', 2);
hold off;
xlabel('Water-Cement Ratio');
ylabel('Compressive Strength');
legend('Actual Data', 'Linear Regression Fit (Water-Cement Ratio)');
title('Linear Regression: Predicted vs. Actual Compressive Strength (Water-Cement Ratio)');
