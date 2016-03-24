Rails.application.routes.draw do
  resources :projects do
    resources :features, only: [:new, :create, :destroy]
  end
end
