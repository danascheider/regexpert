describe RegXing::Regex do
  describe ".is_posix?" do
    context "when it is" do
      let(:str) { "[[:alpha:]]" }

      it "returns true" do
        expect(described_class.is_posix?(str)).to be true
      end
    end

    context "when it isn't" do
      let(:str) { "[^abc]" }

      it "returns false" do
        expect(described_class.is_posix?(str)).to be false
      end
    end
  end

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
        expect(exp.split).to eql [[ '\d', 1 ]]
      end
    end

    context "multiple items" do
      let(:exp) { described_class.new(/\d\w/) }

      it "returns an array of character classes" do
        expect(exp.split).to eql [ [ '\d', 1 ], [ '\w', 1 ] ]
      end
    end

    context "with symbols" do
      let(:exp) { described_class.new(/.\d+/) }

      it "handles the symbols properly" do
        expect(exp.split).to eql [ [ '.', 1 ], [ '\d', 1 ] ]
      end
    end

    context "with escaped characters" do
      let(:exp) { described_class.new(/\d+\.\d+/) }

      it "captures the escape" do
        expect(exp.split).to eql [ [ '\d', 1 ], [ '\.', 1 ], [ '\d', 1 ] ]
      end
    end

    context "with ranges" do
      context "with minimum" do
        let(:exp) { described_class.new(/\w{2,}/) }

        it "captures the expression in the curly braces" do
          expect(exp.split).to eql [ [ '\w', 2 ] ]
        end
      end

      context "with maximum" do
        let(:exp) { described_class.new(/\w{,3}/) }

        it "captures the expression in the curly braces" do
          expect(exp.split).to eql [ [ '\w', 1 ] ]
        end
      end

      context "with minimum and maximum" do
        let(:exp) { described_class.new(/\s{2,3}/) }

        it "captures the expression in the curly braces" do
          expect(exp.split).to eql [ [ '\s', 2 ] ]
        end
      end

      context "with literals" do
        let(:exp) { described_class.new(/Jan-\d{2}-2016/) }

        it "captures the literals" do
          expect(exp.split).to eql [ [ 'J', 1 ], [ 'a', 1 ], [ 'n', 1 ], [ '-', 1 ], [ '\d', 2 ], [ '-', 1 ], [ '2', 1 ], [ '0', 1 ], [ '1', 1 ], [ '6', 1 ] ]
        end
      end
    end
  end

  describe "#extract_groupings" do
    let(:exp) { described_class.new(/(a|b)c(\d+)?/) }

    it "separates the groupings" do
      expect(exp.extract_groupings).to eql ['a|b', 'c', '\d+', '?']
    end
  end
end
