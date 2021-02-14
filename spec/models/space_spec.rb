require "spec_helper"

RSpec.describe "Space" do
    before do
      user =  FactoryBot.create(:user)
      @space = FactoryBot.create(:space, user: user)
    end

    describe "name" do
        example "factorybotのspaceが有効" do
          expect(@space).to be_valid
        end

        example "nameがnildだとエラー" do
            @space.name = nil
            @space.valid?
            expect(@space.errors[:name]).to include("を入力してください")
        end
        
        example "nameが20文字以上だとエラー" do
            @space.name = "a"*21
            @space.valid?
            expect(@space.errors[:name]).to include("は20文字以内で入力してください")
        end

        example "prefがnilだとエラー" do
            @space.pref = nil
            @space.valid?
            expect(@space.errors[:pref]).to include("を入力してください")
        end

        example "prefが9文字以上だとエラー" do
            @space.pref = "a"*9
            @space.valid?
            expect(@space.errors[:pref]).to include("は8文字以内で入力してください")
        end

        example "prefがnilだとエラー" do
            @space.city= nil
            @space.valid?
            expect(@space.errors[:city]).to include("を入力してください")
        end

        example "prefが9文字以上だとエラー" do
            @space.city = "a"*21
            @space.valid?
            expect(@space.errors[:city]).to include("は20文字以内で入力してください")
        end
    end
end