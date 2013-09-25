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
  
  #  describe "AJAX POST #create" do
  #    it "responds successfully with an HTTP 200 status code" do
  #      xhr :post, :create, {temperature: { :value => 123, :units => 'C', :to_units => 'F'} }
  #      expect(response).to be_success
  #      expect(response.status).to eq(200)
  #    end

  #    it "renders the create template" do
  #      xhr :post, :create, {temperature: { :value => 123, :units => 'C', :to_units => 'F'} }
  #      expect(response).to render_template("create")
  #    end

  #    it "loads result" do
  #      xhr :post, :create, {temperature: { :value => "123", :units => 'C', :to_units => 'F'} }
  #      expect(assigns(:result)).to match("253.4 F")
  #    end
    
  #    it "loads result with invalid data" do
  #      xhr :post, :create, {temperature: { :value => "Some data", :units => 'C', :to_units => 'F'} }
  #      expect(assigns(:result)).to match("Invalid Data")
  #    end
  #  end
  #end

end
