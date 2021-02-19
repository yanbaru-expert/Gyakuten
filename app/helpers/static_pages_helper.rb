module StaticPagesHelper
  def static_layouts
    controller_name == "static_pages" ? "static-base-container" : "base-container"
  end
end
