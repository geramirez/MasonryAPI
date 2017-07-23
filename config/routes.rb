Rails.application.routes.draw do
  root to: "home#index"
  scope '/api' do
    scope '/v1' do
        resources :components, only: [:index, :show] do
        resources :references, only: [:index, :show]
        resources :verifications, only: [:index, :show]
        resources :satisfies, only: [:index, :show]
      end
    end
  end
end
