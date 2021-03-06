Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/cocktails', to: 'cocktails#index'
  # root to: 'cocktails#index'
  # get 'cocktails/new', to: 'cocktails#new',  as: :new_cocktail
  # get 'cocktails/:id', to: 'cocktails#show', as: :cocktail
  root to: 'cocktails#index'
  resources :cocktails, except: :index do
    resources :doses, only: [:new, :create]
  end
  resources :ingredients
  resources :doses, only: [:destroy]
end
