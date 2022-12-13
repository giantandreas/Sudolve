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

    gray = rgb2gray(board_img);
    bw = imbinarize(gray);
    edgei = edge(bw, "canny");
    subplot(2,2,1);
    imshow(edgei);

    edgei = imclose(edgei, strel('line', 2, 0));
    edgei = imclose(edgei, strel('line', 2, 90));

    subplot(2,2,2);
    imshow(edgei);


    edgei = imfill(edgei, 'holes');
    subplot(2,2,3);
    imshow(edgei);

    propsnum = regionprops(edgei, 'BoundingBox','Area', 'Image');
    disp(numel(propsnum));

end