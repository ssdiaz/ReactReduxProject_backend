Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :trips do 
        resources :attendees, :activities          
      end
    end
  end
end
