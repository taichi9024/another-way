require "rails_helper"

RSpec.describe Staff do
    describe "name" do
        example "何らかの文字列を渡すとnameが保存される" do
            user = User.new
            user.name = "hoge"
            expect(user.name).to be_kind_of(String)
        end

        example "nameにnilを渡たすとエラー" do
            user = User.new
            user.name = nil
            expect(user).to be_invalid
        end

        example "nameが20文字以上だとエラーが出る" do
            user = User.new
            user.name = "a"*21
            user.valid?
            expect(user.errors[:name]).to include("は20文字以内で入力してください")
        end

        example "emailが不正だとエラーが出る" do
            user = User.new
            user.email = "hoge@@gmail.com"
            user.valid?
            expect(user.errors[:email]).to include("は不正な値です")
        end

        example "telが文字列だとエラーが出る" do
            user = User.new
            user.tel = "hoge"
            user.valid?
            expect(user.errors[:tel]).to include("は数値で入力してください")
        end
    end
end