require 'spec_helper'

describe 'riak::config' do
  it { should contain_file('/etc/riak/app.config') }
  it { should contain_file('/etc/riak/vm.args') }
end
