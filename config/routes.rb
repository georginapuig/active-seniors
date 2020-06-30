Rails.application.routes.draw do
  get 'checkout/new'
  devise_for :users
  root to: 'pages#home'
  resources :offers do
    resources :reviews, only: :create
    resources :bookings, only: [:new, :create] do
      resources :checkouts, only: [:new, :create]
    end
  end
  resources :reviews, only: [ :destroy ]
  get "/bookings/:id/chat", to: "chatrooms#show", as: :chat
end
