ImageHelper.module_eval do
  
  def photo_for_with_title(object, img_options = [], options = {})
    if object.respond_to?(:photo_text) && !(title = object.photo_text).blank?
      options.reverse_merge!(:title => title, :alt => title)
    end
    photo_for_without_title(object, img_options, options)
  end
  alias_method_chain :photo_for, :title
  
end