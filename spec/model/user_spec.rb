require "rails_helper"

RSpec.describe User, :type => :model do

  let(:user)    {User.create!(email: "user@example.com", password: "12345678", password_confirmation: "12345678")}
  let(:author)  {User.create!(email: "author@example.com", password: "12345678", password_confirmation: "12345678")}
  let(:article) {Article.create!(title: "The title", text: "The body", author: author)}
  let(:test_category_name) {"Test Category"}

  describe "::titles_in_category" do

    it "return an empty array if the user has no associated articles" do
      expect(user.titles_in_category(test_category_name)).to be_empty
    end

    it "returns an empty array if the user has an article with no categories" do
      expect(author.titles_in_category(test_category_name)).to be_empty
    end

    it "returns an empty array if the user has a categorized article but the categories do not match" do
      new_category = Category.create!(name: "New category")
      article.categories << new_category
      expect(author.titles_in_category(test_category_name)).to be_empty
    end
gin/
    it "returns the article title if the user has an article with the requested category name" do
      new_category=Category.create!(name: test_category_name)
      article.categories << new_category
      expect(author.titles_in_category(test_category_name)).to eq([article.title])
    end
  end
end
