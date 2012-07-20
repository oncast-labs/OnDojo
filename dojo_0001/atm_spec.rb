require 'atm'

describe Atm do

  let(:atm) { Atm.new({ 10 => 1, 20 => 1, 50 => 1, 100 => 2 }) }

  context "when receiving 0" do
    it "should return empty map" do
      atm.withdraw(0).should == {}
    end
  end

  context "when receiving exact bill values" do
    [10,20,50,100].each do |value|
      it "should return a map with one #{value}" do
        atm.withdraw(value).should == { value => 1 }
      end
    end
  end

  context "when receiving composite values" do
    it "should return one 10 and one 20" do
      atm.withdraw(30).should == { 10 => 1, 20 => 1 }
    end

    it "should return two 20" do
      atm.withdraw(40).should == { 20 => 2 }
    end

    it "should return one 10, one 20, one 50" do
      atm.withdraw(80).should == { 10 => 1, 20 => 1, 50 => 1 }
    end
  end

  context "when there is no 50 and receiving 50" do
    let(:atm) { Atm.new({ 10 => 1, 20 => 2, 50 => 0, 100 => 2 }) }

    it "should return one 10 and two 20" do
      atm.withdraw(50).should == { 10 => 1, 20 => 2 }
    end
  end

  context "when there is nothing and receiving any value" do
    let(:atm) { Atm.new({ 10 => 0, 20 => 0, 50 => 0, 100 => 0 }) }

    it "should return one 10 and two 20" do
      lambda { atm.withdraw(50) }.should raise_error(RuntimeError, "No bills available")
    end
  end
end
