Rails.application.routes.draw do
  root 'twitter#index'
  get '/search' => 'twitter#search', as: :search
  get '/load_more' => 'twitter#load_more', as: :load_more
  get '/recent' => 'twitter#get_recents', as: :recent
end
