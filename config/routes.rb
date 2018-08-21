Rails.application.routes.draw do

  resources :posts do 
    member do 
      put '/upvote' => 'posts#upvote'
    end
    resources :comments do
      member do 
        # member routes require an id
        put '/upvote' => 'comments#upvote'
      end
    end
  end

end
