Rails.application.routes.draw do
  
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

   root :to => "public/homes#top"


  scope module: :public do
    delete '/cart_items/destroy_all' => 'cart_items#destroy_all', as: 'destroy_all'
    get '/orders/thanks' => 'orders#thanks', as: 'thanks'
    resources :items, only:[:index, :show]
    resources :cart_items, only:[:index, :update, :destroy, :create]
    resources :addresses, only:[:index, :edit, :create, :update, :destroy]
    resources :orders, only:[:new, :index, :show, :create]

    get 'homes/about'
    get 'customers/mypage' => 'customers#show', as: 'mypage'
    get 'customers/mypage/edit' => 'customers#edit', as: 'edit'
    patch 'customers/mypage' => 'customers#update', as: 'customer'

    get '/customers/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
    patch '/customers/withdraw' => 'customers#withdraw', as: 'withdraw'

    post '/orders/confirm' => 'orders#confirm', as: 'confirm'
 

  end


  namespace :admin do
    
    get '/'  => 'homes#top'
    resources :genres, only:[:index, :create, :edit, :update]
    resources :items, only:[:index, :new, :create, :show, :edit, :update]
    resources :customers, only:[:index, :show, :edit, :update]
    resources :orders, only:[:index, :show, :update]
    resources :order_details, only:[:update]

    
  end

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
