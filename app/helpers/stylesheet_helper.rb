module StylesheetHelper
  def base_color
    case controller_name
    when "lines" then "line-bg-color"
    when "static_pages" then "static-bg-color"
    else "base-bg-color"
    end
  end

  def max_width
    if devise_controller?
      "mw-sm"
    elsif controller_name.in?(%w[my_pages movies]) ||
      (controller_name.in?(%w[texts challenges]) && action_name == "index") ||
      controller_name == "static_pages"
      "mw-xl"
    else
      "mw-md"
    end
  end
end
