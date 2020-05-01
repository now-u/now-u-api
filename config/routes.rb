Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get :campaigns, to: 'campaigns#index'
      get '/campaigns/:id', to: 'campaigns#show'
      get '/campaigns/:id/actions', to: 'actions#index'
      get '/campaigns/:campaign_id/actions/:id', to: 'actions#show'
      get '/campaigns/:campaign_id/actions/:id/articles', to: 'action_articles#index'
      get '/campaigns/:id/articles', to: 'campaign_articles#index'
      get '/articles/:id', to: 'articles#show'
    end
  end
end
