require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/results/edit.html.erb" do
  include ResultsHelper

  before(:each) do
    assigns[:result] = @result = stub_model(Result,
      :new_record? => false,
      :value => 1
    )
  end

  it "renders the edit result form" do
    render

    response.should have_tag("form[action=#{result_path(@result)}][method=post]") do
      with_tag('input#result_value[name=?]', "result[value]")
    end
  end
end
