require 'rails_helper'
describe Review do
  describe '#create' do
    it "1文字以上150文字以内でないと投稿できないこと" do
      review.valid?
      expect(review.errors[:review]).to include("を入力してください")
    end
  end
end