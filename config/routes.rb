Rails.application.routes.draw do
    
  devise_for :podcasts
    
    resources :podcasts, only: [:index, :show] do #creates resources for our podcasts
      resources :episodes #resources for episodes, nested in the podcasts route
      end
      
      authenticated :podcast do # devise method that roots the application to the podcast dashboard if the user is signed in
        root 'podcasts#dashboard', as: "authenticated_root"
      end
      
      root 'welcome#index' # makes the root of the application go to the welcome controller if a user is not signed in
end
