ActionController::Routing::Routes.draw do |map|
  Jammit::Routes.draw(map)
  map.login 'login', :controller => 'users', :action => 'login'
  map.fb_login 'fb_login', :controller => 'users', :action => 'fb_login'
  map.logout 'logout', :controller => 'users', :action => 'logout'
  map.signup 'signup', :controller => "users", :action => 'signup'

  map.search 'search', :controller => "search", :action => "index"

  map.forgot  'forgot', :controller => 'users', :action => 'forgot'
  map.reset  'reset/:reset_code', :controller => 'users', :action => 'reset'
  map.activate  'activate/:activation_code', :controller => 'users', :action => 'activate'

  map.namespace :admin do |admin|
    admin.root :controller => "index"
    
    admin.map 'albums/add_photos/:id', :controller => "albums", :action => "add_photos"
    admin.map 'albums/uploader', :controller => "albums", :action => "uploader"
    admin.map 'albums/set_cover/:id', :controller => "albums", :action => "set_cover"
    admin.map 'features/add_files/:id', :controller => "features", :action => "add_files"
    admin.map 'features/uploader', :controller => "features", :action => "uploader"
    admin.map 'tickers/add_files/:id', :controller => "tickers", :action => "add_files"
    admin.map 'tickers/uploader', :controller => "tickers", :action => "uploader"
    admin.map 'articles/add_files/:id', :controller => "articles", :action => "add_files"
    admin.map 'articles/uploader',      :controller => "articles", :action => "uploader"
    admin.map 'users/promote/:id',      :controller => "users", :action => "promote"
    admin.map 'users/demote/:id',      :controller => "users", :action => "demote"
    
    admin.resources :logos, :member => { :move_up => :put, :move_down => :put, :move_to_top => :put, :move_to_bottom => :put }
    admin.resources :tvs
    admin.resources :downloads
    admin.resources :albums, :member => {:set_cover => :put}
    admin.resources :photos, :member => { :move_up => :put, :move_down => :put, :move_to_top => :put, :move_to_bottom => :put }
    admin.resources :articles
    admin.resources :events
    admin.resources :features, :member => { :move_up => :put, :move_down => :put, :move_to_top => :put, :move_to_bottom => :put }
    admin.resources :tickers, :member => { :move_up => :put, :move_down => :put, :move_to_top => :put, :move_to_bottom => :put }
    admin.resources :statuses, :member => { :move_up => :put, :move_down => :put, :move_to_top => :put, :move_to_bottom => :put }
    
    
    admin.resources :categories, :member => { :move_up => :put, :move_down => :put, :move_to_top => :put, :move_to_bottom => :put } do |category|
      category.resources :forums
      category.resources :permissions
    end

    admin.chronic 'chronic', :controller => 'chronic'

    admin.resources :configurations, :collection => { :update_all => :put }
    admin.resources :forums, :member => { :move_up => :put, :move_down => :put, :move_to_top => :put, :move_to_bottom => :put } do |forum|
      forum.resources :permissions
    end

    admin.resources :groups do |group|
      group.resources :members
      group.resources :users
      # For finding the permissions for a group in regards to a single forum.
      group.resources :forums do |forum|
        forum.resources :permissions
      end

      group.resources :permissions
    end

    admin.resources :ips do |ip|
      ip.resources :topics, :only => [:index]
      ip.resources :posts, :only => [:index]
      ip.resources :users, :only => [:index]
    end

    admin.resources :ranks
    admin.resources :themes, :member => { :make_default => :put }
    admin.resources :users, :collection => { :ban_ip => :any, :search => :get}, :member => { :ban => :any, :ban_ip => :any, :remove_banned_ip => :post } do |user|
      user.resources :ips
    end
  end


  map.namespace :moderator do |moderator|
    moderator.root :controller => "index"
    moderator.resources :topics, :member => { :lock => :put, :sticky => :put }, :collection => { :moderate => :post, :merge => :put } do |topic|
      topic.resources :moderations
      topic.resources :posts, :member => { :split => [:get, :post] }
      topic.resources :reports
    end

    moderator.resources :posts do |post| 
      post.resources :moderations
      post.resources :reports
    end

    moderator.resources :moderations

    moderator.resources :reports
  end

  map.resources :categories do |category|
    category.resources :forums
  end

  map.resources :forums, :collection => { :list => :get } do |forum|
    forum.resources :topics, :member => { :lock => :put, :unlock => :put }
  end

  map.resources :messages, :member => { :reply => :get }, :collection => { :sent => :get, :change => :put }

  map.resources :posts, :member => { :destroy => :any } do |post|
    post.resources :edits
    post.resources :reports
  end

  map.resources :subscriptions

  map.resources :topics, :member => { :reply => :get, :unlock => :put, :lock => :put } do |topic|
    topic.resources :posts, :member => { :reply => :get }
    topic.resources :subscriptions
    topic.resources :reports
  end

  map.connect 'users/contact', :controller => 'users', :action => 'contact'
  map.connect 'users/jobs', :controller => 'users', :action => 'jobs'
  map.connect 'users/send_email', :controller => 'users', :action => 'send_email'
  map.connect 'users/jobs_email', :controller => 'users', :action => 'jobs_email'
  map.resources :users, :member => { :profile => :any }, :collection => { :signup => [:get, :post], :ip_is_banned => :get } do |user|
    user.resources :posts
  end
  
  
  
  
  

  # pretty pagination links
  map.connect 'forums/:forum_id/topics/:id/:page', :controller => "topics", :action => "show"
  map.connect 'forums/:id/:page', :controller => "forums", :action => "show"
  
  map.connect 'albums/slide/:id.:format', :controller => "albums", :action => "slide"
  map.connect 'albums/slide_click/:id', :controller => "albums", :action => "slide_click"

  map.connect 'pages/terms', :controller => "pages", :action => "terms"
  map.connect 'pages/privacy', :controller => "pages", :action => "privacy"

  map.connect 'tvs/watch/:id', :controller => "tvs", :action => "watch"
  map.connect 'downloads/download/:id', :controller => "downloads", :action => "download"
  map.resources :articles, :only => :show
  map.resources :features, :only => :show
  map.resources :admin
  map.resources :home, :only => :index
  map.resources :tvs, :only => [:index, :show]
  map.resources :downloads, :only => :index
  map.resources :albums, :only => [:index, :show]
  map.resources :shop, :only => :index
  map.resources :discussions, :only => :index
  map.resources :welcome, :only => :index
  map.resources :partners, :only => :index

  map.root :controller => "home", :action => "index"
end