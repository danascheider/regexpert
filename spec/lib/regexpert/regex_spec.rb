describe Regexpert::Regex do
  describe "#to_s" do
    let(:exp) { described_class.new(/.*/) }

    it "converts to a string" do
      expect(exp.to_s).to be_a String
    end

    it "removes the slashes" do
      expect(exp.to_s).to eql ".*"
    end
  end

  describe "#split" do
    context "basic case" do
      let(:exp) { described_class.new(/\d/) }

      it "returns the expression as an array" do
        expect(exp.split).to eql [ '\d' ]
      end
    end

    context "multiple items" do
      let(:exp) { described_class.new(/\d\w/) }

      it "returns an array of character classes" do
        expect(exp.split).to eql [ '\d', '\w' ]
      end
    end
  end
end
