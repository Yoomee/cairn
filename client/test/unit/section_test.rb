require File.dirname(__FILE__) + '/../../../test/test_helper'
class SectionTest < ActiveSupport::TestCase
  
  should have_db_column(:page_type_name).of_type(:string)
  
end