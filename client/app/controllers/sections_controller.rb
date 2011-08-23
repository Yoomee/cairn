SectionsController.class_eval do

  def show_with_client
    if @section.slug.try(:match, /_products$/)
      @pages_sections = @section.pages + @section.children
      @pages_sections = @pages_sections.sort_by(&:weight)
      @departments = @section.pages.tag_counts.sort
      render :action => :products
    elsif @section.view == "normal"
      @pages_sections = @section.pages + @section.children
      @pages_sections = @pages_sections.sort_by(&:weight)
      render
    else
      show_without_client
    end
  end
  alias_method_chain :show, :client

end