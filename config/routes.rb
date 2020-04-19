Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get :campaigns, to: 'campaigns#index'
      get '/campaigns/:id', to: 'campaigns#show'
      get '/actions/:id', to: 'actions#show'
    end
  end
end
