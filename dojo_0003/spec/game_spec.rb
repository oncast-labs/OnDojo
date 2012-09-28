require 'spec_helper'

require 'game'

describe Game do
	
  context 'when game starts with default position' do
  	before do
  		subject.put_cloud(0, [2, 6, 7])
    	subject.put_cloud(1, [1, 2])
    	subject.put_cloud(2, [0, 1, 2])
    	subject.put_cloud(3, [1])
    	subject.put_cloud(4, [1])
  	end

  	before do
		subject.put_airport(2, [4, 7])
    	subject.put_airport(4, [6])
    	subject.put_airport(5, [3])
	end

  	it { subject.day_when_first_airport_under_clouds.should be 3 }

  end

  context 'when game starts in the position of day two' do
  	before do
  		subject.put_cloud(0, [1, 2, 3, 5, 6, 7])
    	subject.put_cloud(1, [0, 1, 2, 3, 6, 7])
    	subject.put_cloud(2, [0, 1, 2, 3])
    	subject.put_cloud(3, [0, 1, 2])
    	subject.put_cloud(4, [0, 1, 2])
    	subject.put_cloud(5, [1])
  	end

  	before do
		subject.put_airport(2, [4, 7])
    	subject.put_airport(4, [6])
    	subject.put_airport(5, [3])
	end

  	it { subject.day_when_first_airport_under_clouds.should be 2 }
  end

  context 'when game ends in day five' do
  	before do
  		subject.put_cloud(0, [0])
  		subject.put_airport(0, [5])
  	end

  	it { subject.day_when_first_airport_under_clouds.should be 6 }
  end

  context 'when airport is in the same vertical position' do
  	before do
  		subject.put_cloud(0, [0])
  		subject.put_airport(3, [0])
  	end

  	it { subject.day_when_first_airport_under_clouds.should be 4 }
  end

end