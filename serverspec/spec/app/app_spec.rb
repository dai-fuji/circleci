require 'spec_helper'

describe package('nginx'), :if => os[:family] == 'amazon' do
  it { should be_installed }
end

describe process("nginx") do
  it { should be_running }
end

describe file('/home/ec2-user/rails-app/rails_app/tmp/sockets/unicorn.sock') do
  it { should be_socket }
end

describe file('/etc/nginx/conf.d/sample.conf') do
  its(:content) { should match /\/home\/ec2-user\/rails-app\/rails_app\/tmp\/sockets\/unicorn\.sock/ }
end


