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

      context "word characters" do
        let(:expression) { /\w+/ }

        it "generates a matching string" do
          expect(Regexpert.generate(expression)).to match expression
        end
      end

      context "nonword characters" do
        let(:expression) { /\W+/ }

        it "generates a matching string" do
          expect(Regexpert.generate(expression)).to match expression
        end
      end

      context "non-numeric strings" do
        let(:expression) { /\D+/ }

        it "generates a matching string" do
          expect(Regexpert.generate(expression)).to match expression
        end
      end

      context "hexdigit characters" do
        let(:expression) { /\h+/ }

        it "generates a matching string" do
          expect(Regexpert.generate(expression)).to match expression
        end
      end

      context "non-hexdigit characters" do
        let(:expression) { /\H+/ }

        it "generates a matching string" do
          expect(Regexpert.generate(expression)).to match expression
        end
      end

      context "whitespace" do
        let(:expression) { /\s+/ }

        it "generates a matching string" do
          expect(Regexpert.generate(expression)).to match expression
        end
      end

      context "non-whitespace" do
        let(:expression) { /\S+/ }

        it "generates a matching string" do
          expect(Regexpert.generate(expression)).to match expression
        end
      end
    end
  end
end
