Rails.application.routes.draw do
  root 'home#index'

  resources :students, except: [:show]
  resources :courses, except: [:show]
end
