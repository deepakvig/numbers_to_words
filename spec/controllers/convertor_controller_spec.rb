require 'spec_helper'

describe ConvertorController do
  
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

  end
  
  describe "AJAX POST #create" do
    it "responds successfully with an HTTP 200 status code" do
      xhr :post, :create, {convert: { :value => 123} }
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "renders the create template" do
      xhr :post, :create, {convert: { :value => 123} }
      expect(response).to render_template("create")
    end

    it "loads result" do
      xhr :post, :create, {convert: { :value => 123} }
      expect(assigns(:result)).to match("one hundred and twenty three")
    end
    
    it "loads result with invalid data" do
      xhr :post, :create, {convert: { :value => "Invalid Value"} }
      expect(assigns(:result)).to match("Please enter a valid Integer Value")
    end
  end
end
