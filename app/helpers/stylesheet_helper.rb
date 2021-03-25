module StylesheetHelper
  def base_color
    case controller_name
    when "lines" then "line-bg-color"
    when "static_pages" then "base-bg-color"
    else "base-bg-color"
    end
  end

  def max_width
    if devise_controller?
      "mw-sm"
    elsif controller_name.in?(%w[my_pages movies]) ||
      (controller_name.in?(%w[texts challenges]) && action_name == "index") ||
      "mw-xl"

    elsif controller_name == "static_pages"
      ""
    else
      "mw-md"
    end
  end
end
