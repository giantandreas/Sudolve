function create_template()

    one         =imread('characters/1.bmp');  
    two         =imread('characters/2.bmp');
    three       =imread('characters/3.bmp');
    four        =imread('characters/4.bmp');
    five        =imread('characters/5.bmp'); 
    six         =imread('characters/6.bmp');
    seven       =imread('characters/7.bmp');
    eight       =imread('characters/8.bmp');
    nine        =imread('characters/9.bmp'); 
    fourfill    =imread('characters/fill4.bmp');
    sixfill     =imread('characters/fill6.bmp');
    sixfill2    =imread('characters/fill6_2.bmp');
    eightfill   =imread('characters/fill8.bmp');
    ninefill    =imread('characters/fill9.bmp');
    ninefill2   =imread('characters/fill9_2.bmp');
    
    number = [one two three four fourfill five six sixfill sixfill2 seven eight eightfill nine ninefill ninefill2];
    
    number_templates = mat2cell(number,42,24*ones(15,1));
    
    save('number_templates','number_templates')
end