
% Carico il file .db3 con ros2bagreader
bag = ros2bagreader('C:\Users\HP\Desktop\my_bag_250_50\my_bag_3\my_bag_3_0.db3');	% percorso file

% Visualizzo i topic disponibili nel bag file
topicList = bag.AvailableTopics;
disp(topicList);

% Seleziono il topic che contiene le torques
msgs = readMessages(select(bag, 'Topic', '/effort_controller/commands'));

% Numero di messaggi letti
n = numel(msgs);

% Pre-allocazione per i dati
torqueValues = zeros(n, 7);  % Poiché ho 7 torques per messaggio

% Estrazione dei valori di torque
for i = 1:n
    torqueValues(i, :) = msgs{i}.data';
end

% Asse temporale
timeRelativo = 1:n;
figure;  
hold on;
% Plot di tutte le torques 
for j = 1:7
    plot(timeRelativo, torqueValues(:, j), 'DisplayName', ['Torque ' num2str(j)]);
end

% Legenda 
xlabel('Time');
ylabel('Torque values');
title('Torque values in time');
legend show;  
xlim([0 300]);
grid on;
hold off;
