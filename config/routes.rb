V5::Application.routes.draw do
  resources :covers

  resources :groups

  resources :users

  root to: 'home#index'

  resources :articles, except: [:show, :destroy, :update]
  constraints({ type: Regexp.new(Article::URL_TYPES.join('|')), id: /\d+/, slug: /[a-z0-9\-\_]+/ }) do
    get '/:type/:id-:slug' => 'articles#show'
    delete '/:type/:id-:slug' => 'articles#destroy'
    patch '/:type/:id-:slug' => 'articles#update'
  end
end
