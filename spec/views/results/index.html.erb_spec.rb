require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/results/index.html.erb" do
  include ResultsHelper

  before(:each) do
    assigns[:results] = [
      stub_model(Result,
        :value => 1
      ),
      stub_model(Result,
        :value => 1
      )
    ]
  end

  it "renders a list of results" do
    render
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end
