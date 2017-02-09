Rails.application.routes.draw do
  get 'admin', to: 'admins#welcome'
  get 'admin/log_in', to: 'admins#authenticate'
  get 'admin/console', to: 'admins#console'

  get 'users/log_in', to: 'users#authenticate'
  get 'users/log_out', to: 'users#logout'
  resources :users do
    resources :contributions, :only => [:index]
  end

  resources :stories do
    resources :contributions
  end
end
