require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/results/show.html.erb" do
  include ResultsHelper
  before(:each) do
    assigns[:result] = @result = stub_model(Result,
      :value => 1
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/1/)
  end
end
