require 'spec_helper'

describe "Stocks" do
  describe "GET /stocks" do
    it "works! (now write some real specs)" do
      get stocks_path
      expect(response.status).to be(200)
    end
  end
end
