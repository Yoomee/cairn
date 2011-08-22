PagesController.class_eval do
  
  before_filter :handle_facelist, :only => [:create, :update]
  
  private  
  def handle_facelist
    params[:page] ||= {}
    params[:page][:tag_list] = params[:facelist_values_tags] if !params[:facelist_values_tags].nil?
  end
  
end