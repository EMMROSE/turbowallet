Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

   resources :investments
   post 'investments/parsing', to: "investments#parsing", as: "parsing"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
