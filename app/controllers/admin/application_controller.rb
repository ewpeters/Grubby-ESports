class Admin::ApplicationController < ApplicationController
  layout "admin"
  helper "namespaced"
  before_filter :can_access
  before_filter :can_not_manage
  before_filter :find_sections
  before_filter :login_required

  private
    def can_access
      if !current_user.can?(:access_admin_section)
        flash[:notice] = t(:need_to_be_admin)
        redirect_back_or_default(root_path)
      end
    end

    def can_not_manage
      unless controller_name == "index" || controller_name == "chronic"
        if !current_user.can?("manage_#{controller_name}")
          flash[:notice] = t(:not_allowed_to_manage, :area => controller_name)
          redirect_to admin_root_path
        end
      end
    end

    def find_sections
      @sections = ["categories", "forums", "users", "groups", "ranks", "themes", "configurations", "tickers", "features", "articles", "events", "downloads", "tvs", "albums", "logos", "statuses", "shop_items"].select do |name|
        current_user.can?("manage_#{name}")
      end
    end
end
