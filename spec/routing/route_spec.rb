require 'spec_helper'
describe "routing to index" do
  it "routes / to convertor#index" do
    expect(:get => "/").to route_to(
      :controller => "convertor",
      :action => "index"
    )
  end

  it "post request to go to create action" do
    expect(:post => "/").to route_to(
      :controller => "convertor",
      :action => "create"
    )
  end
end