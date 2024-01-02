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
          resources :sessions, only: [:index, :create, :destroy]
        end
      end
    end
  end
end
