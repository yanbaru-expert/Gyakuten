module StylesheetHelper
  def base_color
    controller_name == "lines" ? "line-bg-color" : "base-bg-color"
    controller_name == "static_pages" ? "static-bg-color" : "base-bg-color"
  end

  def max_width
    if devise_controller?
      "mw-sm"
    elsif controller_name.in?(%w[my_pages movies]) || (controller_name.in?(%w[texts challenges]) && action_name == "index")
      "mw-xl"
    else
      "mw-md"
    end
  end
end
