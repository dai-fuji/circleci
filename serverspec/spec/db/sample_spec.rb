require 'spec_helper'

describe package('nginx'), :if => os[:family] == 'amazon' do
  it { should be_installed }
end


describe port(80) do
  it { should be_listening }
end

describe port(22) do
  it { should be_listening }
end



describe command('date') do
  its(:stdout) { should match /JST/ }
end

describe user('ec2-user') do
  it { should exist }
end

describe file('/home/ec2-user/rails-app/rails_app') do
  it { should be_directory }
  it { should be_owned_by 'ec2-user' }
  it { should be_grouped_into 'ec2-user' }
end