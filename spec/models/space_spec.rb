require 'spec_helper'

RSpec.describe 'Space' do
  before do
    user = FactoryBot.create(:user)
    @space = FactoryBot.create(:space, user: user)
  end

  describe 'attributes' do
    example 'factorybotのspaceが有効' do
      expect(@space).to be_valid
    end

    example 'nameがnildだとエラー' do
      @space.name = nil
      @space.valid?
      expect(@space.errors[:name]).to include('を入力してください')
    end

    example 'nameが20文字以上だとエラー' do
      @space.name = 'a' * 21
      @space.valid?
      expect(@space.errors[:name]).to include('は20文字以内で入力してください')
    end

    example 'prefがnilだとエラー' do
      @space.pref = nil
      @space.valid?
      expect(@space.errors[:pref]).to include('を入力してください')
    end

    example 'prefが9文字以上だとエラー' do
      @space.pref = 'a' * 9
      @space.valid?
      expect(@space.errors[:pref]).to include('は8文字以内で入力してください')
    end

    example 'prefがnilだとエラー' do
      @space.city = nil
      @space.valid?
      expect(@space.errors[:city]).to include('を入力してください')
    end

    example 'prefが9文字以上だとエラー' do
      @space.city = 'a' * 21
      @space.valid?
      expect(@space.errors[:city]).to include('は20文字以内で入力してください')
    end

    example 'detailadrresが存在しないとエラー' do
      @space.detailaddress = nil
      @space.valid?
      expect(@space.errors[:detailaddress]).to include('を入力してください')
    end

    example 'detailadrresが20文字以上だとエラー' do
      @space.detailaddress = 'a' * 21
      @space.valid?
      expect(@space.errors[:detailaddress]).to include('は20文字以内で入力してください')
    end

    example 'stationがないとエラー' do
      @space.station = nil
      @space.valid?
      expect(@space.errors[:station]).to include('を入力してください')
    end

    example 'stationが10文字以上だとエラー' do
      @space.station = 'a' * 11
      @space.valid?
      expect(@space.errors[:station]).to include('は10文字以内で入力してください')
    end

    example 'station_walkが整数でないとエラー' do
      @space.station_walk = 'hoge'
      @space.valid?
      expect(@space.errors[:station_walk]).to include('は数値で入力してください')
    end

    example 'descriptionが存在しないとエラー' do
      @space.description = nil
      @space.valid?
      expect(@space.errors[:description]).to include('を入力してください')
    end

    example 'descriptionが200文字以上だとエラー' do
      @space.description = 'a' * 201
      @space.valid?
      expect(@space.errors[:description]).to include('は200文字以内で入力してください')
    end

    example 'userがないとエラー' do
      @space.user_id = nil
      @space.valid?
      expect(@space.errors[:user_id]).to include('を入力してください')
      expect(@space.errors[:user_id]).to include('は数値で入力してください')
    end

    example 'priceが文字列だとエラー' do
      @space.price = 'hoge'
      @space.valid?
      expect(@space.errors[:price]).to include('は数値で入力してください')
    end

    example 'priceが50円未満だとエラー' do
      @space.price = 49
      @space.valid?
      expect(@space.errors[:price]).to include('は50以上の値にしてください')
    end

    example 'seatが文字列だとエラー' do
      @space.seat = 'hoge'
      @space.valid?
      expect(@space.errors[:seat]).to include('は数値で入力してください')
    end
  end
end
