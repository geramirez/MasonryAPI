Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope '/api' do
    scope '/v1' do
      resources :components, only: [:index, :show] do
        # TODO: find a better of using these controllers
        resources :references, only: [:index, :show]
        resources :verifications, only: [:index, :show]
      end
    end
  end
end
