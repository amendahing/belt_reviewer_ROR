Rails.application.routes.draw do
    root 'sessions#new'

    post 'login' => "sessions#login"

    get 'sessions/new'

    post 'sessions' => "sessions#create"

    delete "sessions/:id" => "sessions#destroy"

    get 'events/index' => "events#index"

    get 'events/:id' => "events#show"

    get 'events/show'

    post 'events' => "events#create"


    get 'events/join/:id' => "events#join"

    post 'messages' => "messages#create"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end