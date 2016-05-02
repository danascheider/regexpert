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

        context "whitespace" do
          let(:expression) { /\s+/ }
          it_behaves_like "a matching string generator"
        end

        context "non-whitespace" do
          let(:expression) { /\S+/ }
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
