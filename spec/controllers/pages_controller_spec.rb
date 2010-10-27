require 'spec_helper'

describe PagesController do
  render_views

  before(:each) do
    @base_title = "Ruby on Rails Tutorial Sample App"
  end

  describe "GET 'トップページを閲覧するとき'" do
    it "正常に表示されること" do
      get 'home'
      response.should be_success
    end

    it "正しいタイトルが表示されること" do
      get 'home'
      response.should have_selector("title", :content => "#{@base_title} | Home")
    end
  end

  describe "GET 'コンタクトページを閲覧するとき'" do
    it "正常に表示されること" do
      get 'contact'
      response.should be_success
    end

    it "正しいタイトルが表示されること" do
      get 'contact'
      response.should have_selector("title", :content => "#{@base_title} | Contact")
    end
  end

  describe "GET '運営者情報を閲覧するとき'" do
    it "正常に表示されること" do
      get 'about'
      response.should be_success
    end

    it "正しいタイトルが表示されること" do
      get 'about'
      response.should have_selector("title", :content => "#{@base_title} | About")
    end
  end

end
