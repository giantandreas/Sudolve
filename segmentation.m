function board_img = segmentation(img)
    % Get plate image from vehicle image
    
    img = imresize(img, [1000 NaN]);
    gray = rgb2gray(img);
    bw = imbinarize(gray);
    edge_img = edge(bw, "canny");
    

    edge_img = imclose(edge_img, strel('line', 3, 0));
    edge_img = imclose(edge_img, strel('line', 3, 90));
    
    edge_img = imfill(edge_img, 'holes');

    edge_img = imerode(edge_img,strel('line',10,90));
    
    edge_img = bwareaopen(edge_img, 1000);
    
    props = regionprops(edge_img, 'BoundingBox','Area', 'Image');

    maxarea = 0;
    num_el = numel(props);

    for i=1 : num_el
        if (maxarea < props(i).Area)
            maxarea = props(i).Area;
            bb = props(i).BoundingBox;
        end
    end

    board_img = imcrop(img, bb);
end