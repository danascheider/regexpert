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

    describe "\A and \z" do
      let(:expression) { /\A\d{3}\z/ }
      it_behaves_like "a matching string generator"
    end

    describe "alternators" do
      # let(:expression) { /a|b/ }
      # it_behaves_like "a matching string generator"
    end

    describe "groupings" do
      # let(:expression) { /(a|b)efg(c\d+){2}/ }
      # it_behaves_like "a matching string generator"
    end
  end
end
