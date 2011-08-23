ActionController::Routing::Routes.draw do |map|
  map.resources :sections, :only => [] do |sections|
    sections.resources :tags, :only => [:index]
  end
  
end