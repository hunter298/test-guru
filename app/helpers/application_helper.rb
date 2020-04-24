module ApplicationHelper
  def current_year
    Time.current.strftime("%Y")
  end

  def github_url(author, repo)
    link_to 'GitHub', "http://github.com/#{author}/#{repo}", target: '_blank', class: "text-dark"
  end

  def flash_message(type)
    if flash[type]
      content_tag :p, flash[type], class: "#{type} alert"
    end
  end
end
