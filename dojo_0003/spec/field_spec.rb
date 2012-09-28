require 'spec_helper'

require 'field'

describe Field do

	context 'should add cloud' do
		it { subject.add_cloud(1, 1).should be_true }
	end

end