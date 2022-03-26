Rails.application.routes.draw do
  # resources :trips
  namespace :api do
    namespace :v1 do
      # resources :trips do 
      #   resources :attendees, :key => :name
      #   resources :activities     
      # end
      resources :trips do 
        resources :attendees, :activities          
      end
    end
  end
end

# fetch('http://localhost:3000/api/v1/attendees')
# fetch('http://localhost:3000/api/v1/activities')