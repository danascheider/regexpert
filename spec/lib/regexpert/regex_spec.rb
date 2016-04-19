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

    context "with symbols" do
      let(:exp) { described_class.new(/.\d+/) }

      it "handles the symbols properly" do
        expect(exp.split).to eql [ '.', '\d', '+' ]
      end
    end

    context "with escaped characters" do
      let(:exp) { described_class.new(/\d+\.\d+/) }

      it "captures the escape" do
        expect(exp.split).to eql [ '\d', '+', '\.', '\d', '+' ]
      end
    end

    context "with ranges" do
      context "with minimum" do
        let(:exp) { described_class.new(/\w{2,}/) }

        it "captures the expression in the curly braces" do
          expect(exp.split).to eql [ '\w', '{2,}' ]
        end
      end

      context "with maximum" do
        let(:exp) { described_class.new(/\w{,3}/) }

        it "captures the expression in the curly braces" do
          expect(exp.split).to eql [ '\w', '{,3}' ]
        end
      end

      context "with minimum and maximum" do
        let(:exp) { described_class.new(/\s{2,3}/) }

        it "captures the expression in the curly braces" do
          expect(exp.split).to eql [ '\s', '{2,3}' ]
        end
      end
    end
  end
end
