require "rails_helper"

RSpec.describe Staff do
    describe "password" do
        example "何らかの文字列を渡すとpassword_digestが保存される" do
            staff = Staff.new
            staff.password = "hogehoge"
            expect(staff.password_digest).to be_kind_of(String)
            expect(staff.password_digest.size).to eq(60)
        end
    end

    describe "password" do
        example "何も渡さないとpassword_digestがnil" do
            staff = Staff.new
            staff.password = ""
            expect(staff.password_digest).to eq(nil)
        end
    end

    describe "password" do
        example "nilを渡すとpassword_digestがnil" do
            staff = Staff.new
            staff.password = nil
            expect(staff.password_digest).to eq(nil)
        end
    end
end