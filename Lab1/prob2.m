%% SS1 Lab 1, Problem 2 - finding the angle between 2 vectors

v1 = [4 2 5];
v2 = [3 8 9];

dotProduct = dot(v1, v2);
    cosTheta = dotProduct / (norm(v1) * norm(v2));
angleDeg = acosd(cosTheta);
angleRad = acos(cosTheta);

disp(angleDeg);
disp(angleRad);