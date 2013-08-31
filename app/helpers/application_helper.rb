module ApplicationHelper
  def title
    base_title = "Lost Group"
    @title.nil? ? base_title : "#{base_title} | #{@title}"
  end
end
