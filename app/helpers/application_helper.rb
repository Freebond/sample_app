module ApplicationHelper

  def logo
    image_tag("VMNextAlfa_logo.png", :alt => "VMNextalfa", :class => "round")
  end


  # Return a title on a per-page basis.
  def title
    base_title = "VM Next alfa"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
end
