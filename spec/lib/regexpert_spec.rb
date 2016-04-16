describe Regexpert do
  describe ".generate" do
    context "any number of any characters" do
      let(:expression) { /.*/ }

      it "generates a matching string" do
        expect(expression).to match Regexpert.generate(expression)
      end
    end

    context "at least one character" do
      let(:expression) { /.+/ }

      it "generates a matching string" do
        expect(expression).to match Regexpert.generate(expression)
      end
    end

    context "character types" do
      context "metacharacters" do
        context "numbers" do
          let(:expression) { /\d+/ }

          it "generates a matching string" do
            expect(expression).to match Regexpert.generate(expression)
          end
        end

        context "word characters" do
          let(:expression) { /\w+/ }

          it "generates a matching string" do
            expect(expression).to match Regexpert.generate(expression)
          end
        end

        context "nonword characters" do
          let(:expression) { /\W+/ }

          it "generates a matching string" do
            expect(expression).to match Regexpert.generate(expression)
          end
        end

        context "non-numeric strings" do
          let(:expression) { /\D+/ }

          it "generates a matching string" do
            expect(expression).to match Regexpert.generate(expression)
          end
        end

        context "hexdigit characters" do
          let(:expression) { /\h+/ }

          it "generates a matching string" do
            expect(expression).to match Regexpert.generate(expression)
          end
        end

        context "non-hexdigit characters" do
          let(:expression) { /\H+/ }

          it "generates a matching string" do
            expect(expression).to match Regexpert.generate(expression)
          end
        end

        context "whitespace" do
          let(:expression) { /\s+/ }

          it "generates a matching string" do
            expect(expression).to match Regexpert.generate(expression)
          end
        end

        context "non-whitespace" do
          let(:expression) { /\S+/ }

          it "generates a matching string" do
            expect(expression).to match Regexpert.generate(expression)
          end
        end
      end

      context "POSIX bracket expressions" do
        context "alphanumeric" do
          let(:expression) { /[[:alnum:]]/ }

          it "generates a matching string" do
            expect(expression).to match Regexpert.generate(expression)
          end
        end

        context "letters" do
          let(:expression) { /[[:alpha:]]/ }

          it "generates a matching string" do
            expect(expression).to match Regexpert.generate(expression)
          end
        end

        context "numbers" do
          let(:expression) { /[[:digit:]]/ }

          it "generates a matching string" do
            expect(expression).to match Regexpert.generate(expression)
          end
        end

        context "non-blank characters" do
          let(:expression) { /[[:graph:]]/ }

          it "generates a matching string" do
            expect(expression).to match Regexpert.generate(expression)
          end
        end

        context "lowercase letters" do
          let(:expression) { /[[:lower:]]/ }

          it "generates a matching string" do
            expect(expression).to match Regexpert.generate(expression)
          end
        end

        context "print character" do
          let(:expression) { /[[:print:]]/ }

          it "generates a matching string" do
            expect(expression).to match Regexpert.generate(expression)
          end
        end

        context "hexdigit characters" do
          let(:expression) { /[[:xdigit:]]/ }

          it "generates a matching string" do
            expect(expression).to match Regexpert.generate(expression)
          end
        end

        context "punctuation" do
          let(:expression) { /[[:punct:]]/ }

          it "generates a matching string" do
            expect(expression).to match Regexpert.generate(expression)
          end
        end

        context "whitespace" do
          let(:expression) { /[[:space:]]/ }

          it "generates a matching string" do
            expect(expression).to match Regexpert.generate(expression)
          end
        end

        context "control characters" do
          let(:expression) { /[[:cntrl:]]/ }

          it "generates a matching string" do
            expect(expression).to match Regexpert.generate(expression)
          end
        end
      end
    end
  end
end
