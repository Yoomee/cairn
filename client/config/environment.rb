class ClientEnvironment
  
  class << self
    
    def setup(config)
      config.gem 'searchlogic'
      config.gem 'acts_as_list'
    end
    
  end
    
end
