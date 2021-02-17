require 'rails_helper'

describe 'Userの新規登録と更新' do
  describe '新規登録' do
    let(:params_hash) { attributes_for(:user) }

    example '新規登録後スペーシ一覧ページに移動' do
      post user_registration_path, params: { user: params_hash }
      expect(response).to redirect_to(spaces_path)
    end
  end
end
