require 'minitest/autorun'
require_relative 'image'

class TestImageBlur < MiniTest::Unit::TestCase
    
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
        
        actual = image.image_blur
        
        assert_equal expected, actual.img
    end
    
    def test_imageBlur2
        
        img_arry = [
            [0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0],
            [0,0,0,1,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,1],
        ]
        
        image = Image.new(img_arry)

        expected = [
            [0,0,0,0,0,0,0,0,0],
            [0,0,0,1,0,0,0,0,0],
            [0,0,1,1,1,0,0,0,0],
            [0,1,1,1,1,1,0,0,0],
            [1,1,1,1,1,1,1,0,0],
            [0,1,1,1,1,1,0,0,0],
            [0,0,1,1,1,0,0,0,0],
            [0,0,0,1,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,1],
            [0,0,0,0,0,0,0,1,1],
            [0,0,0,0,0,0,1,1,1],
            [0,0,0,0,0,1,1,1,1],
        ]
        
        actual = image.image_blur(distance:3)
        
        assert_equal expected, actual.img
    end
end