Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'api/v1/users/sessions',
    registrations: 'api/v1/users/registrations'
  }

  namespace :auth, path: 'api/v1/users' do
    devise_scope :user do
      post 'sign_in', to: 'sessions#create'
      delete 'sign_out', to: 'sessions#destroy'
    end
  end
  
end
