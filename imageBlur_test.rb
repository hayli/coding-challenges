require 'minitest/autorun'
require_relative 'image'

class TestImageBlur < Minitest::Test
    
    def test_imageBlur1 
        image = Image.new([
            [0,0,0,0],
            [0,1,0,0],
            [0,0,0,1],
            [0,0,0,0]
        ])
    
        expected = [
            [0,1,0,0],
            [1,1,1,1],
            [0,1,1,1],
            [0,0,0,1]
        ]
        
        assert_equal expected, image.image_blur
    end
    
    def test_imageBlur2
        
        distance = 3
        
        img_arry = [
            [0,0,0,0],
            [0,1,0,0],
            [0,0,0,1],
            [0,0,0,0]
        ]
        
        image = Image.new(img_arry)
    
        expected = img_arry
        # Loop over each row in array.
        expected.each_with_index do |row,i|
        
            # Loop over each cell in the row.
            row.each_with_index do |pixel,j|
                if pixel == 1
                    #changing pixels within range of before and after target pixel to 1 
                    expected[i-distance..i+distance][j-distance..j+distance].map! {|x| x=1}
                end
            end

        end
        
        assert_equal expected, image.image_blur_dist(distance)
    end
    
end

