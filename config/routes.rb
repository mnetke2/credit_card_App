Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'loans#index'
  resources :loans
  namespace :admin do
    get 'panel' => 'admin/loans#index'
    resources :loans do 
      member do 
        patch :approve
      end
    end
  end
end
