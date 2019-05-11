require 'writing/pencil'

RSpec.describe Writing::Pencil do
  describe '#new' do
    context 'no args' do
      it { is_expected.to have_attributes(:length => 10) }
      it { is_expected.to have_attributes(:point_durability => 1000) }
      it { is_expected.to have_attributes(:eraser_durability => 1000) }
    end

    context 'with args' do
      subject { described_class.new eraser_durability: 696, length: 5, point_durability: 22 }
      it { is_expected.to have_attributes(:eraser_durability => 696) }
      it { is_expected.to have_attributes(:length => 5) }
      it { is_expected.to have_attributes(:point_durability => 22) }
    end
  end

  describe "#write" do
    let(:pencil) { described_class.new }
    subject { pencil.write(*arguments) }

    context "new sheet of paper" do
      let(:arguments) { ["", "Hello World"] }

      it "appends text to empty paper" do
        is_expected.to eq "Hello World"
      end
    end

    context "used sheet of paper" do
      let(:arguments) { ["She sells sea shells", " down by the sea shore"] }

      it "appends to existing text" do
        is_expected.to eq "She sells sea shells down by the sea shore"
      end
    end

    context "pencil just degraded" do
      let(:pencil) { described_class.new point_durability: 3 }
      let(:arguments) { ["", "hello"] }
      it "begins writing blank spaces once pencil degrades" do
        is_expected.to eq "hel  "
      end
    end

    context "pencil already fully degraded" do
      let(:pencil) { described_class.new point_durability: -100 }
      let(:arguments) { ["", "hello"] }
      it "writes only blank spaces" do
        is_expected.to eq "     "
      end
    end
  end

  describe "point_durability" do
    let(:pencil) { described_class.new }
    subject { pencil.point_durability }

    context "lowercase letters" do
      it "degrades by point value of one for each char" do
        pencil.write("", "hello")
        is_expected.to eq 995
      end
    end

    context "UPPERCASE letters" do
      it "degrades by point value of two for each char" do
        pencil.write("", "HELLO")
        is_expected.to eq 990
      end
    end

    context "lowercase & UPPERCASE letters" do
      it "degrades by 0 for whitespace, 1 for lower case/special, 2 for UPPER case" do
        pencil.write("", "I AM YELLING and now i'm not.")
        is_expected.to eq 967
      end
    end
  end
end