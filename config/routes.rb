Rails.application.routes.draw do
  get 'users/log_in', to: 'users#authenticate'
  get 'users/log_out', to: 'users#logout'
  resources :users do
    resources :contributions, :only => [:index]
  end

  resources :stories do
    resources :contributions
  end
end
