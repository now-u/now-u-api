Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get :campaigns, to: 'campaigns#index'
    end
  end
end
