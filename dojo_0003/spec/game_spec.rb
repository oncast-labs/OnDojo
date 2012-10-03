require 'spec_helper'

require 'game'

describe Game do

  context "when there is a cloud on (0, 0) and a airport on (0, 0)" do
    before do
      subject.put_cloud(0, 0)
      subject.put_airport(0, 0)
    end

    it "the cloud should reach the first airport on 1st day" do
      subject.reach_the_first_airport_on_day.should be 1
    end
    it "the cloud should reach the last airport on 1st day" do
      subject.reach_the_last_airport_on_day.should be 1
    end
  end

  context "when there is a cloud on (0, 0) and a airport on (0, 3)" do
    before do
      subject.put_cloud(0, 0)
      subject.put_airport(0, 3)
    end

    it "the cloud should reach the first airport on 4th day" do
      subject.reach_the_first_airport_on_day.should be 4
    end
    it "the cloud should reach the last airport on 4th day" do
      subject.reach_the_last_airport_on_day.should be 4
    end
  end

  context "when there is a cloud on (0, 0) and a airport on (5, 0)" do
    before do
      subject.put_cloud(0, 0)
      subject.put_airport(5, 0)
    end

    it "the cloud should reach the first airport on 6th day" do
      subject.reach_the_first_airport_on_day.should be 6
    end
    it "the cloud should reach the last airport on 6th day" do
      subject.reach_the_last_airport_on_day.should be 6
    end 
  end

  context "when there is a cloud on (2, 1) and a airport on (0, 0)" do
    before do
      subject.put_cloud(2, 1)
      subject.put_airport(0, 0)
    end

    it "the cloud should reach the first airport on 4th day" do
      subject.reach_the_first_airport_on_day.should be 4
    end
    it "the cloud should reach the last airport on 4th day" do
      subject.reach_the_last_airport_on_day.should be 4
    end
  end

  context "when there is a cloud on (3, 4) and a airport on (0, 0)" do
    before do
      subject.put_airport(0, 0)
      subject.put_cloud(3, 4)
    end

    it "the cloud should reach the first airport on 8th day" do
      subject.reach_the_first_airport_on_day.should be 8
    end
    it "the cloud should reach the last airport on 8th day" do
      subject.reach_the_last_airport_on_day.should be 8
    end
  end

  context "when there is a cloud on (3, 4) and airports on (1, 3) and (0, 0)" do
    before do
      subject.put_cloud(3, 4)
      subject.put_airport(1, 3)        
      subject.put_airport(0, 0)
    end

    it "the cloud should reach the first airport on 4th day" do
      subject.reach_the_first_airport_on_day.should be 4
    end
    it "the cloud should reach the last airport on 8th day" do
      subject.reach_the_last_airport_on_day.should be 8
    end
  end
  context "when there is clouds on (3, 4) and (2, 1) and airports on (1, 3) and (0, 0)" do
    before do
      subject.put_cloud(3, 4)
      subject.put_cloud(2, 1)
      subject.put_airport(0, 3)        
      subject.put_airport(0, 0)
    end

    it "the clouds should reach the first airport on 4th day" do
      subject.reach_the_first_airport_on_day.should be 4
    end 
    it "the clouds should reach the last airport on 5th day" do
      subject.reach_the_last_airport_on_day.should be 5
    end
  end
end