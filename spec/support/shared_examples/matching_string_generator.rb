shared_examples "a matching string generator" do
  it "generates a matching string" do
    expect(subject.generate(expression)).to match expression
  end
end
