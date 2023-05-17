Rails.application.routes.draw do
  get 'comments/create'
  resources :projects, only: %i[index show] do
    resources :comments, only: :create
    patch 'change_status', to: 'projects#change_status'
  end
end
