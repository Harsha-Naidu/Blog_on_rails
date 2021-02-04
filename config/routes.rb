Rails.application.routes.draw do

  get("/",{to:"posts#index", as: :root})
  resources :posts do
  resources :comments, only:[:create, :destroy]
  end

  resources :users, only:[:new, :create,:edit,:update]
  resource :session, only:[:new, :create, :destroy]

  get('/users/:id/password/edit', {to: "users#edit_password", as: "edit_password"})
  patch('/users/:id/password/edit', {to: "users#update_password", as: "update_password"})

end
