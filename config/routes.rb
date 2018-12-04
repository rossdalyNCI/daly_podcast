Rails.application.routes.draw do
    
  devise_for :podcasts
    root 'welcome#index' # makes the root of the application go to the welcome controller
end
