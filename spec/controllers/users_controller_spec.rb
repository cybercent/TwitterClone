require 'spec_helper'

describe UsersController do

  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
  end

  if "正しいタイトルが設定されているか" do
    get 'new'
    response.should have_selector('title', :content => "Sign up")
  end

end
