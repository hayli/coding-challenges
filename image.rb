require 'minitest/autorun'

class Image
  attr_accessor :img, :blurred
  
  def initialize(img_array)
    self.img = img_array
  end
  
  def output
    # Loop over each row in array.
    self.img.each do |row|
      # Loop over each cell in the row.
      row.each do |pixel|
        print pixel
      end
      puts "\n"
    end
  end
  
  def output_blurred
    # Loop over each row in array.
    self.blurred.each do |row|
      # Loop over each cell in the row.
      row.each do |pixel|
        print pixel
      end
      puts "\n"
    end
  end
  
  def image_blur(distance: 1)
    blurred = Marshal.load(Marshal.dump(self.img))
    until distance < 1 do
      pixels_on = []
      
      # Loop over each row in array.
      blurred.each_with_index do |row,i|
        # Loop over each cell in the row.
        row.each_with_index do |pixel,j|
          if pixel == 1
            #checking which pixels in the row is on
            pixels_on.push([i,j])
          end
        end
      end
      
      #switching on pixels near the on-pixels
      pixels_on.each do |k|
        #changing pixel to the right
        if blurred[k.last].fetch(k.last+1, false) 
          blurred[k.first][k.last+1] = 1
        end
        #changing pixel to the left
        if blurred[k.last].fetch(k.last-1, false)
          blurred[k.first][k.last-1] = 1
        end
        #changing pixel to the top
        if blurred.fetch(k.first-1, false)
          blurred[k.first-1][k.last] = 1
        end
        #changing pixel to the bottom
        if blurred.fetch(k.first+1, false)
          blurred[k.first+1][k.last] = 1
        end
      end
      
      # if distance == 1
      #   print self.blurred
      # else
      #   image_blur(distance: distance-1)
      #   puts "-----------"
      #   print self.blurred
      # end
      
      distance -= 1
    end
    return Image.new(blurred)
  end
end
