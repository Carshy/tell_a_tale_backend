Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'api/v1/users/registrations',
    sessions: 'api/v1/users/sessions'
  }
  
  namespace :api do
    namespace :v1 do
      namespace :users do
        devise_scope :user do
          resources :registrations, only: [:create]
          resources :sessions, only: [:create, :destroy]
          # post 'sign_up', to: 'registrations#create'
          # post 'sign_in', to: 'sessions#create'
          # delete 'sign_out', to: 'sessions#destroy'
        end
      end
    end
  end
end
