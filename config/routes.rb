
if Rails::VERSION::MAJOR >= 3

  RedmineApp::Application.routes.draw do
    match 'projects/:id/simple_ci/:action', :controller=> 'simple_ci'
    match 'projects/:id/simple_ci_settings/:action', :controller=> 'simple_ci'
  end

else

  ActionController::Routing::Routes.draw do |map|
    map.connect 'projects/:id/simple_ci/:action', :controller => 'simple_ci'
    map.connect 'projects/:id/simple_ci_settings/:action', :controller => 'simple_ci_settings'
  end

end
