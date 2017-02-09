Rails.application.routes.draw do
  get 'users/log_in', to: 'users#authenticate'
  resources :users do
    resources :contributions, :only => [:index]
  end

  resources :stories do
    resources :contributions
  end
end
