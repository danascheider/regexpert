describe RegXing::Generator do
  describe "less simple expressions" do
    describe "given number of characters" do
      let(:expression) { /\w{3}/ }
      it_behaves_like "a matching string generator"
    end

    describe "anchors" do
      let(:expression) { /^\d{3}$/ }
      it_behaves_like "a matching string generator"
    end

    describe "or operators" do
      let(:expression) { /a|b/ }
      it_behaves_like "a matching string generator"
    end
  end
end
