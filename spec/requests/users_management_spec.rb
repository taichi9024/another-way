require 'rails_helper'

feature 'users_management', type: :feature do
  describe 'Userの新規登録と更新' do
    describe '新規登録' do
      example '新規登録成功、space一覧ページに遷移' do
        visit signup_path
        fill_in "user[email]", with: "hoge@hoge.com"
        fill_in "user[name]" , with: "hoge"
        fill_in "user[password]", with: "hogehoge"
        fill_in "user[password_confirmation]", with: "hogehoge"
        click_on "送信する"
        expect(page).to have_selector 'h3', text: '物件一覧'
      end

      example '新規登録失敗、再びsignupページへ遷移' do
        visit signup_path
        fill_in "user[email]", with: nil
        fill_in "user[name]" , with: nil
        fill_in "user[password]", with: nil
        fill_in "user[password_confirmation]", with: nil
        click_on "送信する"
        expect(page).to have_selector 'h2', text: '新規登録'
      end
    end
  end
end
