Rails.application.routes.draw do
  resources :todos, except: %i[show]
  root 'todos#index'
end
