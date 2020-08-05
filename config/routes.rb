Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/team', to:'gossips#team'
  get '/contact', to: 'gossips#contact'

  resources :gossips do
    resources :authors, only: [:show]
    resources :comments
  end

  resources :cities, only: [:show]

  
end