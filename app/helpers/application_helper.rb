module ApplicationHelper
  def is_active?(page)
    "active" if current_page?(page)
  end
end
