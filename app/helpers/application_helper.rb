module ApplicationHelper
  def current_year
    Time.current.strftime("%Y")
  end

  def github_url(author, repo)
    link_to 'GitHub', "http://github.com/#{author}/#{repo}", target: '_blank'
  end

  def flash_message
    if flash[:alert]
      content_tag :p, flash[:alert], class: 'flash alert'
    end
  end
end
