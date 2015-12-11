Rails.application.routes.draw do
  match 'login', to: "user_sessions#new", via: :get
  match 'logout', to: "user_sessions#destroy", via: :get
  get "sitemap.xml" => "home#sitemap", format: :xml, as: :sitemap
  get "robots.txt" => "home#robots", format: :text, as: :robots
  root 'articles#index'

  resources :user_sessions, only: :create
  resources :articles, path: 'blog', only: [:index, :show]
  namespace :admin do
    resources :tags, except: :new
    resources :article_tags, only: :destroy
    resources :articles, except: :show do
      resources :tags, only: :index
      resources :article_tags, only: :create
    end
  end
end
