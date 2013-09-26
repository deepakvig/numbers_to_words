require 'spec_helper'
describe "convertor/index" do
  it "renders _event partial for each event" do
    render
    expect(view).to render_template( "index" )
  end
end
