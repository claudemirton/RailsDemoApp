Rails.application.routes.draw do
  # get 'admin', to: 'admin#index'
  root 'cars#index'
  resources :admin
  resources :cars do
    resources :rentees
  end
end
