Rails.application.routes.draw do
  resources :demos, only: [:show]

  root "demos#show"
end
