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
      get '/users/:id', to: 'users#show'
      post '/users/:id/login', to: 'user_logins#create'

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
