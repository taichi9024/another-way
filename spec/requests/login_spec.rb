require 'rails_helper'

feature 'login', type: :feature do
  describe 'Userのログイン' do
    describe 'ログイン' do
      example 'ログイン失敗後、signupページに遷移' do
        visit login_path
        fill_in 'user[email]', with: 'hoge@gmail.com'
        fill_in 'user[password]', with: 'hogehoge'
        click_on '送信する'

        expect(page).to have_selector '.alert-danger', text: 'メールアドレスまたはパスワードが違います。'
      end
    end
  end
end
