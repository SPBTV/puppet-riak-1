require 'spec_helper'

describe 'riak::config' do
  let(:pre_condition) do
    [
      '$control_users = []',
      '$anti_entropy_build_limit = {}',
      '$anti_entropy_leveldb_opts = {}'
    ]
  end
  it { should contain_file('/etc/riak/app.config') }
  it { should contain_file('/etc/riak/vm.args') }
end
