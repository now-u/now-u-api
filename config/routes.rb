# new user:
#
# 1. enter email
# post /users
#
# 2. receive email
#
# 3. click link
# post /users/1/login?token=1234567
#
# 4. return new token
# { data: { user: { email: 'ok', token: '883737733' } } }
#
# 5. subsequent requests
# headers['token'] = '883737733'


Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/users', to: 'users#create'
      get '/users/me', to: 'users#show'
      post '/users/login', to: 'user_logins#create'

      get '/users/me/actions', to: 'user_actions#index'
      post '/users/me/actions/:id/:status', to: 'user_actions#create', constraints: { status: /(complete|reject)/ }
      # post '/users/me/actions', to: 'user_actions#create'
      delete '/users/me/actions/:id', to: 'user_actions#destroy'

      post '/users/me/campaigns/:id', to: 'user_campaigns#create'
      delete '/users/me/campaigns/:id', to: 'user_campaigns#destroy'

      get :campaigns, to: 'campaigns#index'
      get '/campaigns/:id', to: 'campaigns#show'
      get '/campaigns/:id/actions', to: 'actions#index'
      get '/campaigns/:campaign_id/actions/:id', to: 'actions#show'
      get '/campaigns/:campaign_id/actions/:id/articles', to: 'action_articles#index'
      get '/campaigns/:campaign_id/actions/:id/offers', to: 'action_offers#index'
      get '/campaigns/:id/articles', to: 'campaign_articles#index'
      get '/campaigns/:id/offers', to: 'campaign_offers#index'
      get '/campaigns/:id/learning_topics', to: 'learning_topics#index'
      get '/articles/:id', to: 'articles#show'
      get '/articles', to: 'articles#index'
      get '/offers/:id', to: 'offers#show'
      get '/offers', to: 'offers#index'
      get '/faqs', to: 'faqs#index'
      get '/organisations', to: 'organisations#index'
    end
  end
end
