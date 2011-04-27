require 'spec_helper'

describe Category do

  before(:each) do
    @attr = {
      :content => "value for content",
      :user_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Category.create!(@attr)
  end
end
