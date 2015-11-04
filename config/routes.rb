Rails.application.routes.draw do

namespace :api do
  namespace :v1 do
    resources :customers, only: [:index, :show], defaults: { format: :json} do
      collection do
        get 'random'
        get 'find'
        get 'find_all'
      end
      resources :invoices, only: [:index], module: :customers
      resources :transactions, only: [:index], module: :customers
    end

    resources :invoice_items, only: [:index, :show], defaults: { format: :json} do
      collection do
        get 'random'
        get 'find'
        get 'find_all'
      end
      resource :invoice, only: [:show], module: :invoice_items
      resource :item, only: [:show], module: :invoice_items
    end

    get 'invoices/find', to: 'invoices#find', defaults: {format: :json}
    resources :invoices, only: [:index, :show], defaults: { format: :json}

    get 'items/find', to: 'items#find', defaults: {format: :json}
    resources :items, only: [:index, :show], defaults: { format: :json}

    get 'merchants/find', to: 'merchants#find', defaults: {format: :json}
    resources :merchants, only: [:index, :show], defaults: { format: :json}

    get 'transactions/find', to: 'transactions#find', defaults: {format: :json}
    resources :transactions, only: [:index, :show], defaults: { format: :json}
  end
end

end
