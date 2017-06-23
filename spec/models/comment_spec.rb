require 'rails_helper'

describe Comment do
  describe '#create' do
    let(:user) {create(:user)}
    let(:chatgroup) {create(:chatgroup)}

    it "is valid with a comment" do
      comment = build(:comment, image: nil)
      expect(comment).to be_valid
    end

    it "is valid with a image" do
      comment = build(:comment, comment: nil)
      expect(comment).to be_valid
    end

    it "is valid with a comment and a image" do
      comment = build(:comment)
      expect(comment).to be_valid
    end

    it "is invalid without a comment and a image" do

      comment = build(:comment,comment: nil ,image: nil)
      comment.valid?
      expect(comment.errors.messages[:comment]).to include("を入力してください")
    end

    it "is invalid without a chatgroup_id" do
      comment = build(:comment,chatgroup_id: nil)
      comment.valid?
      expect(comment.errors.messages[:chatgroup_id]).to include("を入力してください")
    end

    it "is invalid without a user_id" do
      comment = build(:comment,user_id: nil)
      comment.valid?
      expect(comment.errors.messages[:user_id]).to include("を入力してください")
    end

  end
end
