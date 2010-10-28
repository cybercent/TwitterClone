require 'spec_helper'

describe "Users" do

  describe "ログイン" do
    
    describe "失敗するパターン" do
      
      # TODO:インテグレーションテスト後回し
      #it "ユーザー情報未入力の場合、サインアップできないこと" do
      #   lambda do
      #     visit signup_path
      #     fill_in "Name", :with => ""
      #     fill_in "Email", :with => ""
      #     fill_in "Password", :with => ""
      #     fill_in "Confirmation", :with => ""
      #     click_button
      #     response.should have_selector("div#error_explanation")
      #   end.should_not change(User, :count)
      # end
    end
  end
end
