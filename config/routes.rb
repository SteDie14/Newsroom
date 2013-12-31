Newsgrabber::Application.routes.draw do

  resources :accounts

  resources :expenses

  resources :incomes

  devise_for :users
  post '/synchronize', to: 'news_items#synchronize'

  get '/keywords', to: 'news_items#keywords'

  resources :folders

  root :to => 'news_items#index'

  resources :news_items do
    collection do
      put 'update_multiple'
    end
  end

  resources :rss_sources do
    member do
      post 'synchronize'
    end
  end

end
