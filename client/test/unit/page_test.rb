require File.dirname(__FILE__) + '/../../../test/test_helper'
class PageTest < ActiveSupport::TestCase
  
  should have_db_column(:photo_text).of_type(:string)
  
end