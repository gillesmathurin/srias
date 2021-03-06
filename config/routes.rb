ActionController::Routing::Routes.draw do |map|
  map.resources :offres, :has_many => :fichiers

  map.resources :categories

  map.resources :annonces
  
  map.masquerannonce '/masquer_annonce', :controller => 'javascripts', :action => 'masquer_annonce'

  map.resources :contacts

  map.resources :texte_accueils

  map.resources :newsletters, :member => {:deliver => :get, :deliver_test => :get}

  map.resources :abonnes, :collection => {:delete_all => :get}

  map.resources :partenaires, :has_many => :offres

  map.resources :liens

  map.resources :manifestations, :has_many => [:photos, :fichiers],
   :collection => {:actions => :get, :pending => :put}, :member => {:validate => :put, :unvalidate => :put}
  map.actions "actions", :controller => "manifestations", :action => "actions"
  map.uneaction "une-action/:id", :controller => "manifestations", :action => "show"

  map.resources :missions do |missions|
    missions.resources :manifestations, :collection => {:actions => :get, :pending => :put}, :member => {:validate => :put, :unvalidate => :put}
  end

  map.login "login", :controller => "user_sessions", :action => "new"
  map.logout "logout", :controller => "user_sessions", :action => "destroy"
  # map.contact "contacts", :controller => "missions", :action => "contact"
  map.resource :user_session
  map.resource :account, :controller => "users"
  map.resources :users
  
  map.root :controller => "welcome", :action => "accueil"
  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
