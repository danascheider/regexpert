shared_examples "a matching string generator" do
  it "generates a matching string" do
    puts Regexpert.generate(expression)
    expect(Regexpert.generate(expression)).to match expression
  end
end
