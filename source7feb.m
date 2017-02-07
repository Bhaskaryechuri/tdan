try
 fclose(instrfind);
end;


s7 = serial('COM7', ... % Change as needed!
 'BaudRate', 115200, ...
 'Parity', 'none', ...
 'DataBits', 8, ...
 'StopBits', 1, ...
 'FlowControl', 'none');
fopen(s7);

try
 fprintf('Press CTRL+C to finish\n');

 x = [1 2 3 4 5];
 y = [2 1 2 3 4];
 
hLine = plot(x,y);
ylim([0, 50]);

StripChart('Initialize',gca)        %Initializing the stripchart

 while (1)
 val=fscanf(s7);
 result = sscanf(val, '%f');
 
 fprintf('T=%5.2fC\n', result);
 if result >25
     fprintf('WOW!!!!!11111 so hot');end
 
 
 
 StripChart('Update', hLine, result)
 pause(1);
 end

end

fclose(s7);