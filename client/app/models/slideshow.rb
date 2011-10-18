Slideshow.class_eval do
  
  class << self
    
    def homepage
      Slideshow.first || Slideshow.create(:active => true)
    end
    
  end
  
end