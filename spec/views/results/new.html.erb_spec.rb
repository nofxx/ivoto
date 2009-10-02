require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/results/new.html.erb" do
  include ResultsHelper

  before(:each) do
    assigns[:result] = stub_model(Result,
      :new_record? => true,
      :value => 1
    )
  end

  it "renders new result form" do
    render

    response.should have_tag("form[action=?][method=post]", results_path) do
      with_tag("input#result_value[name=?]", "result[value]")
    end
  end
end
