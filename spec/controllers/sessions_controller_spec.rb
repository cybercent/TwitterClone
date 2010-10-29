require 'spec_helper'

describe SessionsController do

  describe "GET 'Sign inページを閲覧するとき'" do
    render_views

    it "正常に表示されること" do
      get 'new'
      response.should be_success
    end

    it "正しいタイトルが表示されること" do
      get 'new'
      response.should have_selector("title", :content => "Ruby on Rails Tutorial Sample App | Sign in")
    end
  end
  
  describe "POST 'Sign inページにて Sign inするとき'" do
    describe "失敗するパターン" do
      before(:each) do
        @attr = { :email => "email@example.com", :password => "invalid" }
      end
      it "同一ページが表示されること" do
        post :create, :session => @attr
        response.should render_template('new')
      end
    end
    
    describe "成功するパターン" do
      before(:each) do
        @user = Factory(:user)
        @attr = { :email => @user.email, :password => @user.password }
      end
      it "ログインできること" do
        post :create, :session => @attr
        controller.current_user.should == @user
        controller.should be_signed_in
      end
      it "つぶやきページが表示されること" do
        post :create, :session => @attr
        response.should redirect_to(root_path)
      end
    end
  end

  describe "DELETE 'Sign outするとき'" do
    it "ログアウトできること" do
      test_sign_in(Factory(:user))
      delete :destroy
      controller.should_not be_signed_in
      response.should redirect_to(root_path)
    end
  end
end
