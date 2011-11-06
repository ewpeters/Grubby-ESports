module NamespacedHelper
  def selected(name)
    if (params[:controller] == "admin/index" && name == "index") ||
       (params[:controller] == "admin/users" && name == "users" && params[:action] != "ban_ip") ||
       (params[:controller] == "admin/groups" && name == "groups") ||
       (params[:controller] == "admin/ranks" && name == "ranks") ||
       (params[:controller] == "admin/themes" && name == "themes") ||
       (params[:controller] == "admin/forums" && name == "forums") ||
       (params[:controller] == "admin/categories" && name == "categories") ||
       (params[:controller] == "admin/configurations" && name == "configurations") ||
       (params[:controller] == "admin/tickers" && name == "tickers") ||
       (params[:controller] == "admin/events" && name == "events") ||
       (params[:controller] == "admin/features" && name == "features") ||
       (params[:controller] == "admin/shop_items" && name == "shop_items") ||
       (params[:controller] == "admin/articles" && name == "articles") ||
       (params[:controller] == "admin/downloads" && name == "downloads") ||
       (params[:controller] == "admin/tvs" && name == "tvs") ||
       (params[:controller] == "admin/albums" && name == "albums") ||
       (params[:controller] == "admin/users" && name == "ip_banning" && params[:action] == "ban_ip") ||
       (params[:controller] == "moderator/index" && name == "index") ||
       (params[:controller] == "moderator/moderations" && name == "moderation") ||
       (params[:controller] == "moderator/reports" && name == "reports") ||
       (params[:controller] == "moderator/banned_users" && name == "banned_users") ||
       (params[:controller] == "moderator/banned_ips" && name == "banned_ips") 
      'selected'
    end
  end

  def report_text(reportable)
    if reportable.is_a?(Topic)
      "#{link_to(reportable.subject, forum_topic_path(reportable.forum, reportable))} by #{reportable.user}"
    elsif reportable.is_a?(Post)
      link_to("post ##{reportable.topic.posts.index(reportable) + 1}", forum_topic_path(@reportable.forum, @reportable.topic) + "/#{@reportable.page_for(current_user)}" + "#post_#{@reportable.id}") + 
      " in " + link_to(reportable.subject, forum_topic_path(reportable.forum, reportable.topic)) + " by #{reportable.user}"

    end
  end
end
