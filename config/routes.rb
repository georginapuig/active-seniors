Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :offers do
    resources :reviews, only: :create
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: :index
  get "/bookings/:id/chat", to: "chatrooms#show", as: :chat
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
