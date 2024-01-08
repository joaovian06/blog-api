require 'rails_helper'

RSpec.describe Article, type: :model do
  describe "factory" do
    context "valid" do
      let(:article) { create(:article) }

      it { expect(article).to be_valid }
    end

    context "traits" do
      context "invalid" do
        let(:article) { create(:article, :invalid) }

        it { is_expected.to be_invalid }
      end
    end
  end

  describe "columns" do
    it { is_expected.to have_db_column(:title) }
    it { is_expected.to have_db_column(:body) }
    it { is_expected.to have_db_column(:author) }
  end

  describe "validations" do
    context "title" do
      it { is_expected.to validate_presence_of(:title) }
      it do
        is_expected.to validate_length_of(:title)
          .is_at_least(10)
          .is_at_most(50)
      end

      it do
        is_expected.to validate_uniqueness_of(:title)
          .scoped_to(:author)
          .with_message("Title already taken, please choose another.")
      end
    end

    context "body" do
      it { is_expected.to validate_presence_of(:body) }
    end


    context "author" do
      # let(:article_invalid_author) { build(:article, author: "1234") }

      it { is_expected.to validate_presence_of(:author) }
      it do
        # expect(article_invalid_author.validate).to be_falsy 
        is_expected.not_to allow_value("1234")
          .for(:author)
          .with_message("Author can not have only numbers.")
      end
    end
  end
end
