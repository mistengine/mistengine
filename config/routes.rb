MistEngine::Application.routes.draw do
  resources :groups
  resources :users

  root to: 'home#index'

  resources :articles, only: [:index, :show]
  constraints({ type: Regexp.new(Article::URL_TYPES.join('|')), id: /\d+/, slug: /[a-z0-9\-\_]+/ }) do
    get '/:type/:id-:slug' => 'articles#show'
    delete '/:type/:id-:slug' => 'articles#destroy'
    patch '/:type/:id-:slug' => 'articles#update'
  end

  namespace :admin do
    resources :covers
    resources :articles
  end
end
