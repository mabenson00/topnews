Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :stories, only: [] do
    put :favorite, on: :member
    put :unfavorite, on: :member
  end
end
