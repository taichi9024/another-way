require 'rails_helper'

RSpec.describe Feedback do
  before do
    @feedback = FactoryBot.create(:feedback)
  end
  describe 'attributes' do
    example 'factorybotのfeedbackが有効' do
      expect(@feedback).to be_valid
    end
    example 'contentが20文字以下' do
      @feedback.content = 'hoge'
      @feedback.valid?
      expect(@feedback.errors[:content]).to include('は20文字以上で入力してください')
    end

    example 'emailが存在しない' do
      @feedback.email = nil
      @feedback.valid?
      expect(@feedback.errors[:email]).to include('を入力してください')
    end

    example 'emailが不正な値' do
      @feedback.email = 'hoge@@hoge.com'
      @feedback.valid?
      expect(@feedback.errors[:email]).to include('は不正な値です')
    end
  end
end
