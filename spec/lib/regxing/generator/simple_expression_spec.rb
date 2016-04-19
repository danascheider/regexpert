describe RegXing::Generator do
  describe ".generate" do
    context "any number of any characters" do
      let(:expression) { /.*/ }
      it_behaves_like "a matching string generator"
    end

    context "at least one character" do
      let(:expression) { /.+/ }
      it_behaves_like "a matching string generator"
    end

    context "character types" do
      context "metacharacters" do
        context "numbers" do
          let(:expression) { /\d+/ }
          it_behaves_like "a matching string generator"
        end

        context "word characters" do
          let(:expression) { /\w+/ }
          it_behaves_like "a matching string generator"
        end

        context "nonword characters" do
          let(:expression) { /\W+/ }
          it_behaves_like "a matching string generator"
        end

        context "non-numeric strings" do
          let(:expression) { /\D+/ }
          it_behaves_like "a matching string generator"
        end

        context "hexdigit characters" do
          let(:expression) { /\h+/ }
          it_behaves_like "a matching string generator"
        end

        context "non-hexdigit characters" do
          let(:expression) { /\H+/ }
          it_behaves_like "a matching string generator"
        end

        context "whitespace" do
          let(:expression) { /\s+/ }
          it_behaves_like "a matching string generator"
        end

        context "non-whitespace" do
          let(:expression) { /\S+/ }
          it_behaves_like "a matching string generator"
        end
      end

      context "POSIX bracket expressions" do
        context "alphanumeric" do
          let(:expression) { /[[:alnum:]]/ }
          it_behaves_like "a matching string generator"
        end

        context "letters" do
          let(:expression) { /[[:alpha:]]/ }
          it_behaves_like "a matching string generator"
        end

        context "numbers" do
          let(:expression) { /[[:digit:]]/ }
          it_behaves_like "a matching string generator"
        end

        context "non-blank characters" do
          let(:expression) { /[[:graph:]]/ }
          it_behaves_like "a matching string generator"
        end

        context "lowercase letters" do
          let(:expression) { /[[:lower:]]/ }
          it_behaves_like "a matching string generator"
        end

        context "uppercase letters" do
          let(:expression) { /[[:upper:]]/ }
          it_behaves_like "a matching string generator"
        end

        context "print character" do
          let(:expression) { /[[:print:]]/ }
          it_behaves_like "a matching string generator"
        end

        context "hexdigit characters" do
          let(:expression) { /[[:xdigit:]]/ }
          it_behaves_like "a matching string generator"
        end

        context "punctuation" do
          let(:expression) { /[[:punct:]]/ }
          it_behaves_like "a matching string generator"
        end

        context "whitespace" do
          let(:expression) { /[[:space:]]/ }
          it_behaves_like "a matching string generator"
        end

        context "control characters" do
          let(:expression) { /[[:cntrl:]]/ }
          it_behaves_like "a matching string generator"
        end
      end

      context "literals" do
        context "alphanumeric" do
          let(:expression) { /a/ }
          it_behaves_like "a matching string generator"
        end
      end
    end

    context "basic sequences" do
      let(:expression) { /\d+.+/ }
      it_behaves_like "a matching string generator"
    end
  end
end
