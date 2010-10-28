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

    it "名前フィールドが表示されること" do
      get :new
      response.should have_selector("input[name='user[name]'][type='text']")
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

    it "h1タグにユーザーの名前が表示されること" do
      get :show, :id => @user
      response.should have_selector("h1", :content => @user.name)
    end

    it "プロフィール画像が表示されること" do
      get :show, :id => @user
      response.should have_selector("h1>img", :class => "gravatar")
    end

    it "should show the user's microposts" do
      mp1 = Factory(:micropost, :user => @user, :content => "Foo bar")
      mp2 = Factory(:micropost, :user => @user, :content => "Baz quux")
      get :show, :id => @user
      response.should have_selector("span.content", :content => mp1.content)
      response.should have_selector("span.content", :content => mp2.content)
    end

    it "should paginate microposts" do
      35.times { Factory(:micropost, :user => @user, :content => "foo") }
      get :show, :id => @user
      response.should have_selector("div.pagination")
    end

    it "should display the micropost count" do
      10.times { Factory(:micropost, :user => @user, :content => "foo") }
      get :show, :id => @user
      response.should have_selector('td.sidebar',
                                    :content => @user.microposts.count.to_s)

    end
  end

  describe "POST '新規ユーザー作成するとき'" do
    
    describe "失敗するパターン" do
      
      before(:each) do
        @attr = {
          :name => "",
          :email => "",
          :password => "",
          :password_confirmation => ""
        }
      end
      
      it "ユーザー新規登録ができないこと" do
        lambda do
          post :create, :user => @attr
        end.should_not change(User, :count)
      end
      
      it "正しいタイトルが表示されること" do
        post :create, :user => @attr
        response.should have_selector("title", :content => "Sign up")
      end
      
      it "新規登録フォームが表示されること" do
        post :create, :user => @attr
        response.should render_template('new')
      end
    end
    
    describe "成功するパターン" do
      
      before(:each) do
        @attr = {
          :name => "New User",
          :email => "user@example.com",
          :password => "foobar",
          :password_confirmation => "foobar"
        }
      end
      
      it "ユーザーの新規登録ができること" do
        lambda do
          post :create, :user => @attr
        end.should change(User, :count).by(1)
      end
      
      it "つぶやきページが表示されること" do
        post :create, :user => @attr
        response.should redirect_to(user_path(assigns(:user)))
      end
      
      it "ウェルカムメッセージが表示されること" do
        post :create, :user => @attr
        flash[:success].should =~ /welcome to the sample app/i
      end
    end
  end
end
