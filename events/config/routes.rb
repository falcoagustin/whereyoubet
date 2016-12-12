Rails.application.routes.draw do
  get '/events', to: 'events#get_events'
end
