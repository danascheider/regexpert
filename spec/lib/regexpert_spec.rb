describe Regexpert do
  describe ".generate" do
    context "any number of any characters" do
      let(:expression) { /.*/ }

      it "generates a matching string" do
        expect(Regexpert.generate(expression)).to match expression
      end
    end

    context "at least one character" do
      let(:expression) { /.+/ }

      it "generates a matching string" do
        expect(Regexpert.generate(expression)).to match expression
      end
    end

    context "character types" do
      context "numbers" do
        let(:expression) { /\d+/ }
        it "generates a matching string" do
          expect(Regexpert.generate(expression)).to match expression
        end
      end
    end
  end
end
