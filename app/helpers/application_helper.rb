module ApplicationHelper
  def current_year
    Date.current.year
  end

  def github_url(author, repo)
    link_to 'TestGuru, dev by: Alexander Melekhin', "https://github.com/#{author}/#{repo}", target: '_blank'
  end
end
