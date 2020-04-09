module ApplicationHelper
  def current_year
    Time.current.strftime("%Y")
  end

  def github_url(author, repo)
    link_to 'GitHub', "http://github.com/#{author}/#{repo}", target: '_blank'
  end
end
