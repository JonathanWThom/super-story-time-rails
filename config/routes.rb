Rails.application.routes.draw do
  resources :user do
    resources :contributions, :only => [:index]
  end

  resources :story do
    resources :contributions
  end
end
