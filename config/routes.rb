Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
  resources :home
  resources :projects do
    post "match", on: :member
  end
end
