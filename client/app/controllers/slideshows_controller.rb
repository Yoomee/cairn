SlideshowsController.class_eval do
  
  def update
    if @slideshow.update_attributes(params[:slideshow])
      flash[:notice] = "Successfully updated slideshow."
      redirect_to home_path
    else
      render :action => 'edit'
    end
  end
  
end