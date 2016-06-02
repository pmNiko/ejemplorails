require "rails_helper"

RSpec.describe ArticlePolicy, :type => :model do
  subject { ArticlePolicy }

  let(:user)   {User.new(email: "user@example.com", password: "12345678", password_confirmation: "12345678")}
  let(:author) {User.new(email: "author@example.com", password: "12345678", password_confirmation: "12345678")}
  let(:admin) do
    user = User.new(email: "admin@example.com", password: "12345678", password_confirmation: "12345678")
    user.add_role :admin
    user
  end

  let(:article) {Article.new(title: "The title", text: "The body", author: author)}

  permissions :new? do
    it "is denied to non-logged users" do
      expect(subject).not_to permit(nil, Article)
    end

    it "is allowed to any logged in user" do
      expect(subject).to permit(user, Article)
    end
  end

  permissions :destroy? do
    it "is denied to non-logged users" do
      expect(subject).not_to permit(nil, article)
    end

    it "is denied if the user is not the author" do
      expect(subject).not_to permit(user, article)
    end

    it "is allowed if the user is the article author" do
      expect(subject).to permit(author, article)
    end

    it "is allowed if the user is an admin" do
      expect(subject).to permit(admin, article)
    end
  end
end
