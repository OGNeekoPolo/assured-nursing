Rails.application.routes.draw do
  get 'pages/home'

  get 'pages/about'

  get 'pages/contact'

  get '/jobs', to: 'jobs#index'

  get '/upload_jobs', to: 'jobs#insert_jobs'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
