shared_examples "a matching string generator" do
  it "generates a matching string" do
    generator = RegXing::Generator.new(expression)
    expect(generator.generate!).to match expression
  end
end
