Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources "entries"
  resources "places"
  get("/", { :controller => "errors", :action => "not_found" })
  # get("/", { :controller => "articles", :action => "index" })
end
