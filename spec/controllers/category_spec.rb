require_relative '../spec_helper'
require_relative "../rails_helper"

RSpec.describe CategoriesController, :type => :controller do

  before :each do
    @category = Category.new(:category_name => "title", :active => false)
  end

  describe "#new" do
    it "returns a new category object" do
     expect(@category).to be_an_instance_of Category
    end
  end

  describe "#index" do
    it "responds renders index" do
      get :index
      #expect(response).to be_success
      #expect(response).to have_http_status(200)
      #expect(response).to render_template("index")
    end
  end

end