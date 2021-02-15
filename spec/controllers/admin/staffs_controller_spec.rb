require 'rails_helper'

RSpec.describe Admin::StaffsController do
  describe 'BCrypt::Password' do
    example '正しいパスワードならtrue' do
      s = build(:staff)
      expect(BCrypt::Password.new(s.password_digest) == 'admin').to eq(true)
    end

    example 'パスワードがnilならfalse' do
      s = build(:staff)
      expect(BCrypt::Password.new(s.password_digest).nil?).to eq(false)
    end

    example 'パスワードが空欄ならfalse' do
      s = build(:staff)
      expect(BCrypt::Password.new(s.password_digest) == '').to eq(false)
    end

    example 'nmaeが等しいならtrue' do
      s = build(:staff)
      expect(s.name == 'admin').to eq(true)
    end

    example 'nameがnilならfalse' do
      s = build(:staff, name: nil)
      expect(s == 'admin').to eq(false)
    end

    example 'パスワードが空欄ならfalse' do
      s = build(:staff, name: '')
      expect(s == 'admin').to eq(false)
    end

    example 'nameが21文字以上ならfalse' do
      s = build(:staff, name: 'a' * 21)
      expect(s == 'a' * 21).to eq(false)
    end
  end
end
