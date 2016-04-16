describe Regexpert do
  describe ".generate" do
    context "any number of any characters" do
      let(:expression) { /.*/ }

      it "generates a matching string" do
        expect(Regexpert.generate(expression)).to match expression
      end
    end
  end
end
