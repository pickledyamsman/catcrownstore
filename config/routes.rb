Rails.application.routes.draw do
  root 'crowns#index'

  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  
  resources :crowns, only: [:show, :index]

  resource :cart, only: [:show] do
    put 'add/:crown_id', to: 'carts#add', as: :add_to
    put 'remove/:crown_id', to: 'carts#remove', as: :remove_from
  end

  resources :transactions, only: [:new, :create]

end
