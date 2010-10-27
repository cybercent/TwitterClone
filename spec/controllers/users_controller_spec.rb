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

    it "正しくユーザー情報が保存されること" do
      #TODO:テストコードを書く。
    end
  end

  describe "GET 'ユーザーのつぶやきを閲覧するとき'" do
    before(:each) do
      @user = Factory(:user)
    end

    it "つぶやきページが表示されること" do
      get 'show', :id => @user
      response.should be_success
    end

    it "ユーザーが存在すること" do
      get 'show', :id => @user
      assigns(:user).should == @user
    end
  end

end
