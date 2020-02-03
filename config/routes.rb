Rails.application.routes.draw do
  root 'links#new'
  resource :links, only: :create
  get '/:short_url', to: 'links#show'
end
