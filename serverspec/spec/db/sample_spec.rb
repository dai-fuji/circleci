require 'spec_helper'

describe package('httpd'), :if => os[:family] == 'redhat' do
  it { should be_installed }
end

describe package('nginx'), :if => os[:family] == 'amazon' do
 it { should be_installed }
end

describe service('httpd'), :if => os[:family] == 'redhat' do
  it { should be_enabled }
  it { should be_running }
end

describe service('apache2'), :if => os[:family] == 'ubuntu' do
  it { should be_enabled }
  it { should be_running }
end

describe service('org.apache.httpd'), :if => os[:family] == 'darwin' do
  it { should be_enabled }
  it { should be_running }
end

describe port(80) do
  it { should be_listening }
end

describe port(22) do
  it { should be_listening }
end



describe package('nodejs')do
  it { should be_installed }
end
