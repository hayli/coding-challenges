class Image
    def initialize(img_array)
        @img = img_array
    end
    
    def output
        # Loop over each row in array.
        @img.each do |row|
        
            # Loop over each cell in the row.
            row.each do |pixel|
              print pixel
            end
            puts "\n"
   
        end
    end
end

# test = Image.new([
#     [0,0,0,0],
#     [0,1,0,0],
#     [0,0,0,1],
#     [0,0,0,0]
# ])

# test.output