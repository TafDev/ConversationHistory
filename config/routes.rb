Rails.application.routes.draw do
  get 'comments/create'
  resources :projects, only: %i[index show] do
    resources :comments, only: :create
  end
end
