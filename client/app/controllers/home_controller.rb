HomeController.class_eval do

  def index
    @latest_tweet = fetch_latest_tweets_from("cairntechnology", 1, false, false).first
    blog_section = Section.find_by_slug(:blog)
    @blog_posts = blog_section ? blog_section.pages.published.find(:all, :order => "created_at DESC", :limit => 2) : []
  end
  
end
