module StylesheetHelper
  def base_container
    controller_name == "static_pages" ? "static-container" : "base-container"
  end

  def base_color
    controller_name == "lines" ? "line-bg-color" : "base-bg-color"
  end

  def max_width
    if devise_controller?
      "mw-sm"
    elsif controller_name.in?(%w[my_pages movies memos special_texts])
      "mw-xl"
    elsif controller_name.in?(%w[texts challenges]) && action_name == "index"
      "mw-xl"
    elsif controller_name == "static_pages"
      ""
    else
      "mw-md"
    end
  end
end
