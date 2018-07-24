Rails.application.routes.draw do
  resources :group_events do
    patch :published
  end

  root to: 'group_events#index'

  ## API ##
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :group_events do
        patch :published
      end
    end
  end
end
