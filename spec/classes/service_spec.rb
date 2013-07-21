require 'spec_helper'

describe 'riak::service' do
  it { should contain_service('riak') }
end
