require 'spec_helper'

describe "Customers" do
  describe "GET /customers" do
    it "works! (now write some real specs)" do
      get customers_path
      expect(response.status).to be(200)
    end
  end
end
