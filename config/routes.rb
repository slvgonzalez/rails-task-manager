Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # See all
  get '/tasks', to: 'tasks#index'
  # Create
  get '/tasks/new', to: 'tasks#new', as: :new_task
  post '/tasks', to: 'restaurants#create'
  # Read
  get '/tasks/:id', to: 'tasks#show', as: :task
  # Update
  get '/tasks/:id/edit', to: 'restaurants#edit', as: :edit_task
  patch '/restaurants/:id', to: 'restaurants#update'
  # Delete
  delete '/tasks/:id', to: 'tasks#destroy'
end
