describe Regexpert::Regex do
  describe "#split" do
    context "basic case" do
      let(:exp) { described_class.new(/\d/) }

      it "returns the expression as an array" do
        expect(exp.split).to eql [ '\d' ]
      end
    end
  end
end
