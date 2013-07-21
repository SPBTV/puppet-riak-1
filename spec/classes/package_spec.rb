require 'spec_helper'

describe 'riak::package' do
  it { should contain_package('riak') }
end
