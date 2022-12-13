function number=read_number(char_img)
    % function for predicting image character using character templates
    
    load number_templates 
    char_img = imresize(char_img,[42 24]);
    cors = [];
    
    for n = 1:length(number_templates)
        cor = corr2(number_templates{n}, char_img);
        cors = [cors cor];
    end
    index = find(cors == max(cors), 1);
    disp(index);
    
    if index == 1
        number='1';
    elseif index == 2
        number='2';
    elseif index == 3
        number='3';
    elseif index == 4 || index == 5
        number='4';
    elseif index == 6
        number='5';
    elseif index == 7 || index == 8 || index == 9
        number='6';
    elseif index == 10
        number='7';
    elseif index == 11 || index == 12
        number='8';
    elseif index == 13 || index == 14 || index == 15
        number='9';
    else
        number='0';
    end
end