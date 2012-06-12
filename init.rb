# redMine - project management software
# Copyright (C) 2006-2007  Jean-Philippe Lang
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

require 'redmine'

RAILS_DEFAULT_LOGGER.info 'Starting simple CI plugin for Redmine'

# Redmine simple CI plugin
Redmine::Plugin.register :simple_ci do
  name 'Simple CI'
  author 'Jean-Philippe Lang'
  description 'A generic plugin for integrating per project RSS continuous integration feeds in Redmine.'
  version '1.0'
  
  # The feed_url_custom_field setting is used to hold the id of the project custom field
  # that stores the CI feed url for each project
  settings :default => {'feed_url_custom_field' => 0,
                        'success_keyword' => 'success',
                        'show_descriptions' => 2}, :partial => 'settings/simple_ci_settings'

  # This plugin adds a project module
  # It can be enabled/disabled at project level (Project settings -> Modules)
  project_module :continuous_integration do
    # This permission has to be explicitly given
    # It will be listed on the permissions screen
    permission :view_ci_report, {:simple_ci => :show}
  end

  # A new item is added to the project menu
  menu :project_menu, :simple_ci, { :controller => 'simple_ci', :action => 'show' }, :caption => 'Integration'
end
