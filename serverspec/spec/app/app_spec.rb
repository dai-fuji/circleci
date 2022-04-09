require 'spec_helper'


describe process("nginx") do
  it { should be_running }
end

describe file('/home/ec2-user/rails-app/rails_app') do
  it { should be_directory }
  it { should be_owned_by 'ec2-user' }
  it { should be_grouped_into 'ec2-user' }
end

describe file('/home/ec2-user/rails-app/rails_app/tmp/sockets/unicorn.sock') do
  it { should be_socket }
end

describe file('/etc/nginx/conf.d/sample.conf') do
  its(:content) { should match /\/home\/ec2-user\/rails-app\/rails_app\/tmp\/sockets\/unicorn\.sock/ }
end

describe command('curl twitter-demo.learning-fujimoto.com -o /dev/null -w "%{http_code}\n" -s') do
  its(:stdout) { should match /^200$/ }
end
