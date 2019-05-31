require 'babysitter/babysitter'

RSpec.describe "Babysitter" do
  context "standard rate" do
    it "calculates charge for 2 hours of work" do
      pay = calculate_pay(8, 10, 11)
      expect(pay).to eq 24
    end

    it "calculates charge for 1 hour of work" do
      pay = calculate_pay(8, 9, 11)
      expect(pay).to eq 12
    end
  end
  context "bedtime rate" do
    it "calculates charge for 1 hour of work" do
      pay = calculate_pay(8, 9, 8)
      expect(pay).to eq 8
    end

    it "calculates charge for 2 hours of work" do
      pay = calculate_pay(8, 10, 8)
      expect(pay).to eq 16
    end
  end

  context "midnight rate" do
    it "calculates charge for 1 hour of work" do
      pay = calculate_pay(1, 2, 2)
      expect(pay).to eq 16
    end
  end
end