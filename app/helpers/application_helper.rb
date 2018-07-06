module ApplicationHelper

  # returns a full title for every page, on a per-page basis.
  def full_title(page_title = '')
    base_title = "Sampan App"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
  
end
