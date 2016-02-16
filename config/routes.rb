Rails.application.routes.draw do
  root 'chat#index'

  get '/authenticate', to: 'authentication#authenticate', format: :json

  get '/chat', to: 'chat#index'
  get '/chat/support', to: 'chat#support'

  post '/chat/:channel/next', to: 'chat#next'
  post '/chat/finalize', to: 'chat#finalize'

  post '/users/:channel/join', to: 'users#join'

  post '/conversations', to: 'conversations#create'
  post '/conversations/messages', to: 'conversations#messages'
  post '/messages', to: 'messages#create'
end
