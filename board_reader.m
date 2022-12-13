function numbers = board_reader(img)

    numbers = zeros(9);
    resized = imresize(img, [900 900]);

    for x=1:9
        for y=1:9
            cell = resized(x*100-99 : x*100, y*100-99 : y*100, :);
            
             % get edge image
            cell = rgb2gray(cell);
            edge_img = edge(cell, "canny");
            
            % remove borders
            edge_img(1:5, :) = 0;
            edge_img(95:100, :) = 0;
            edge_img(:, 1:5) = 0;
            edge_img(:, 95:100) = 0;

            edge_img = imfill(edge_img, 'holes');
            edge_img = bwareaopen(edge_img, 500);
        
            % regionprops
            props = regionprops(edge_img, 'BoundingBox', 'Image');
            
            if numel(props) == 1
                number = read_number(props(1).Image);
                numbers(x, y) = number;
            end

        end
    end
   
    
end