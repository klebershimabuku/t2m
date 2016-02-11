Rails.application.routes.draw do
  root 'chat#index'

  get '/authenticate', to: 'authentication#authenticate', format: :json

  get '/chat', to: 'chat#index'
  get '/chat/support', to: 'chat#support'

  get '/users/queue', to: 'users#queue'
  get '/users/queue/:queue/online', to: 'users#online'

  post '/conversations', to: 'conversations#create'
  post '/messages', to: 'messages#create'
end
