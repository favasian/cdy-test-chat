Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  

  resources :accounts do 
    resources :owners do 

    end
  end

  resources :owners do 
    resources :users, module: :owner_user do 
      resources :job_posts
      resources :chats do 
        resources :messages
      end
    end
  end


  resources :users, module: :recruiter_user do 
    resources :job_posts do
      resources :chats do
        resources :messages
      end
    end
  end

  resources :providers, module: :provider do 
    resources :job_posts do 
      member do 
        get :apply
      end
    end
    resources :non_clinical_job_posts do 
      member do 
        get :apply
      end
    end
    resources :chats do 
      resources :messages
    end
  end

  resources :vendors do 
    resources :users, module: :vendor_user do 
      resources :non_clinical_job_posts
      resources :chats do 
        resources :messages
      end
    end
  end

  root 'accounts#index'
end
