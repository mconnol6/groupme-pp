Rails.application.routes.draw do
  get '/chatroom' => 'chats#room', :as => :chat
  post '/all_messages' => 'chats#all_messages', :as => :all_messages
  get '/get_all_messages' => 'chats#get_all_messages', :as => :get_all_messages
  get '/login' => 'sessions#new', :as => :login_new
  post '/login' => 'sessions#create', :as => :login_create
  post '/new_message' => 'chats#new_message', :as => :new_message
  get '/choose_channel' => 'chats#choose_channel', :as => :choose_channel
  post '/public_channel' => 'chats#public_channel', :as => :public_channel
  post '/set_channel' => 'chats#set_channel', :as => :set_channel
  get '/channels/get_messages/:channel_name' => 'channels#get_messages_for_channel', :as => :get_messages_for_channel

  root 'chats#choose_channel'

  resources :messages

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
