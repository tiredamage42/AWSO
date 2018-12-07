Rails.application.routes.draw do
  
  devise_for :authors


  # setting the home page
  root to: 'blog/posts#index'



  # expects: /author/posts/jimbob
  namespace :authors do

    get '/account' => 'accounts#edit', as: :account

    # when account info form is submitted
    put '/info' => 'accounts#update_info', as: :info

    # when password form is submitted
    put '/change_password' => 'accounts#change_password', as: :change_password

    #maps http request actions to model
    resources :posts do
      put 'publish' => 'posts#publish', on: :member
      put 'unpublish' => 'posts#unpublish', on: :member
    end
  end

  scope module: 'blog' do
    
    #map get requests    
    get 'about' => 'pages#about', as: :about
    get 'contact' => 'pages#contact', as: :contact
    get 'posts' => 'posts#index', as: :posts

    # 'posts/jimbob' => params[:id] == 'jimbob'
    get 'posts/:id' => 'posts#show', as: :post
    
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
