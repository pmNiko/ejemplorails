require "rails_helper"

RSpec.describe Article, :type => :model do

  let(:author) {User.new(email: "author@example.com", password: "12345678", password_confirmation: "12345678")}

  describe "Validations" do

    it "is not valid if title is absent" do
      expect(Article.new(author: author)).not_to be_valid
    end

    it "is not valid if the title's length is less than 5 characters" do
      expect(Article.new(author: author, title: "Test")).not_to be_valid
    end

    it "is valid if the title's length is 5 characters or more" do
      expect(Article.new(author: author, title: "Tests")).to be_valid
      expect(Article.new(author: author, title: "Test #2")).to be_valid
    end
  end
end
