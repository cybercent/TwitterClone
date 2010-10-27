require 'spec_helper'

describe UsersController do
  render_views

  describe "GET 'ユーザーが新規登録するとき'" do
    it "新規登録フォームが表示されること" do
      get 'new'
      response.should be_success
    end

    it "正しいタイトルが表示されること" do
      get 'new'
      response.should have_selector("title", :content => "Ruby on Rails Tutorial Sample App | Sign up")
    end
  end
end
