Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'api/v1/users/sessions',
    registrations: 'api/v1/users/registrations'
  }
  
  namespace :api do
    namespace :v1 do
      devise_scope :user do
        post 'sign_up', to: 'users/registrations#create'
        post 'sign_in', to: 'users/sessions#create'
        delete 'sign_out', to: 'users/sessions#destroy'
      end
    end
  end

  # namespace :auth, path: 'api/v1/users' do
  #   devise_scope :user do
  #     post 'sign_in', to: 'sessions#create'
  #     delete 'sign_out', to: 'sessions#destroy'
  #   end
  # end
  
end
