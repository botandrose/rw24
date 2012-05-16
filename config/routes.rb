Rw24::Application.routes.draw do |map|
  get "admin" => redirect("/admin/sites/1")

  root :to => "articles#index"

  map.resources :points

  map.leader_board "leader-board/:year", :controller => "teams", :action => "index", :year => nil
  map.leader_board_laps "leader-board/:year/:position", :controller => "teams", :action => "show"

  map.namespace :admin do |admin|
    admin.resources :sites do |site|
      site.resources :races do |race|
        race.resources :teams do |team|
          team.resources :riders
        end
      end
    end
  end

  map.resources :races, :path_prefix => "admin",
    :name_prefix => "admin_global_",
    :namespace   => "admin/"

  map.resources :races, :path_prefix => "admin/sites/:site_id",
    :controller  => "teams",
    :name_prefix => "admin_site_",
    :namespace   => "admin/"

  map.resources :teams, :path_prefix => "admin",
    :name_prefix => "admin_global_",
    :namespace   => "admin/"

  map.resources :teams, :path_prefix => "admin/sites/:site_id",
    :controller  => "teams",
    :name_prefix => "admin_site_",
    :namespace   => "admin/"

  map.resources :riders, :path_prefix => "admin",
    :name_prefix => "admin_global_",
    :namespace   => "admin/"

  map.resources :riders, :path_prefix => "admin/sites/:site_id",
    :controller  => "riders",
    :name_prefix => "admin_site_",
    :namespace   => "admin/"
end
