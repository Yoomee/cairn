TagsController.class_eval do
  admin_only :index
  
  def autocomplete
    search_term = params[:term].gsub('_', ' ').gsub(/[^A-Za-z\d\-\s]/, '').strip
    term_list = [*search_term.gsub('-', ' ').split]
    if term_list.size < 2
      tags = Tag.named_like(term_list.join(" ")).limit(5)
    else
      tags = Tag.named_like(search_term)
      if tags.size < 5
        term_list.each do |term|
          tags += Tag.named_like(term).limit(5 - tags.size) if term.length >= 3
          break if tags.size >= 5
        end
      end
    end
    tags_list = tags.uniq.collect {|t| {:name => t.name.downcase, :value => t.name.downcase}}
    tags_list << {:name => "Click here to add the new department: <em>#{search_term}</em> ", :value => search_term} unless tags_list.collect(&:values).flatten.include?(search_term)
    render :json => tags_list
  end
  
  def index
    if @section = Section.find(params[:section_id])
      @departments = @section.pages.tag_counts.sort.collect(&:to_tag)
    else
      @departments = Tag.all
    end
    render :template => "departments/index"
  end
  
  def destroy
    @department = Tag.find(params[:id])
    render :update do |page|
      if @department.destroy
        page["#{@department.id}_department"].remove
      else
        render :nothing => true
      end
    end
  end
  
  def update
    @department = Tag.find_by_name(CGI::unescape(params[:id]))
    render :update do |page|
      if @department.update_attributes(params[:tag])
        page["#{@department.id}_department"].replace(render("departments/department", :department => @department, :show_form => false))
      else
        page["#{@department.id}_department_form"].replace(render("departments/form", :department => @department, :show_form => true))
        page << "DepartmentForm.show_form('#{@department.id}')"
      end
    end
  end

  
end