Rails.application.routes.draw do
  resources :trips
  namespace :api do
    namespace :v1 do
      resources :attendees
      resources :activities
      resources :trips
    end
  end
end

# fetch('http://localhost:3000/api/v1/attendees')
# fetch('http://localhost:3000/api/v1/activities')