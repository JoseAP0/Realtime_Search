Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root 'searches#index'

  resources :searches do
    collection do
      post :search_analytics
    end
  end

end
