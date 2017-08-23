module ApplicationHelper
  def full_url(url)
    if url.start_with? 'http://'
      url
    else
      "http://#{url}"
    end
  end

  def friendly_date(dt)
    dt.strftime("%m/%d/%Y %l:%M%P %Z")
  end
end
