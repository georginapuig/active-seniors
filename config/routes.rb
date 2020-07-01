Rails.application.routes.draw do
  get 'checkout/new'
  devise_for :users
  root to: 'pages#home'
  resources :offers do
    resources :reviews, only: :create
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: :show do
    resources :checkouts, only: [:new, :create, :show] do
      resources :payments, only: :new
    end
  end
  resources :reviews, only: [ :destroy ]
  get "/bookings/:id/chat", to: "chatrooms#show", as: :chat
  get "/payments/success", to: "payments#success", as: :payments_success
  get "/payments/cancel", to: "payments#cancel", as: :payments_cancel
end
