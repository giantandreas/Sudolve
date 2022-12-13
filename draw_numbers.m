function solved_img = draw_numbers(board, numbers, solution)

    solved_img = imresize(board, [900 900]);

    one     = repmat(imread("characters\draw1.png"), 1, 1, 3);
    two     = repmat(imread("characters\draw2.png"), 1, 1, 3);
    three   = repmat(imread("characters\draw3.png"), 1, 1, 3);
    four    = repmat(imread("characters\draw4.png"), 1, 1, 3);
    five    = repmat(imread("characters\draw5.png"), 1, 1, 3);
    six     = repmat(imread("characters\draw6.png"), 1, 1, 3);
    seven   = repmat(imread("characters\draw7.png"), 1, 1, 3);
    eight   = repmat(imread("characters\draw8.png"), 1, 1, 3);
    nine    = repmat(imread("characters\draw9.png"), 1, 1, 3);
    black   = zeros(90, 90 ,3);
    
    disp(numbers);
    
    for x=1:9
        for y=1:9
            if numbers(x,y) == 0
                n = solution(x,y);

                if n == 1
                    num_img = one;
                elseif n == 2
                    num_img = two;
                elseif n == 3
                    num_img = three;
                elseif n == 4
                    num_img = four;
                elseif n == 5
                    num_img = five;
                elseif n == 6
                    num_img = six;
                elseif n == 7
                    num_img = seven;
                elseif n == 8
                    num_img = eight;
                elseif n == 9
                    num_img = nine;
                else
                    num_img = black;
                end

                solved_img(x*100-99 +15 : x*100 -15, y*100-99 +15 : y*100 -15, :) = num_img;
                
            end
        end
    end

end
