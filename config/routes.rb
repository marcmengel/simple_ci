ActionController::Routing::Routes.draw do |map|
  map.connect 'projects/:id/simple_ci/:action', :controller => 'simple_ci'
  map.connect 'projects/:id/simple_ci_settings/:action', :controller => 'simple_ci_settings'
end
