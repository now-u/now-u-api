Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get :campaigns, to: 'campaigns#index'
      get '/campaigns/:id', to: 'campaigns#show'
      get '/campaigns/:id/actions', to: 'actions#index'
      get '/campaigns/:campaign_id/actions/:id', to: 'actions#show'
      get '/campaigns/:campaign_id/actions/:id/articles', to: 'action_articles#index'
      get '/campaigns/:campaign_id/actions/:id/offers', to: 'action_offers#index'
      get '/campaigns/:id/articles', to: 'campaign_articles#index'
      get '/campaigns/:id/offers', to: 'campaign_offers#index'
      get '/articles/:id', to: 'articles#show'
      get '/articles', to: 'articles#index'
      get '/offers/:id', to: 'offers#show'
      get '/offers', to: 'offers#index'
      get '/faqs', to: 'faqs#index'
      get '/organisations', to: 'organisations#index'
    end
  end
end
