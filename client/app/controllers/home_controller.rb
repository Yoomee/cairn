HomeController.class_eval do

  def index
    @latest_tweet = fetch_latest_tweets_from("cairntechnology", 1, false, false).first
    @blog_posts = Section.find_by_slug(:blog).pages.published.find(:all, :order => "created_at DESC", :limit => 2)
  end
  
end
