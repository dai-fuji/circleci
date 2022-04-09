require 'spec_helper'

describe package('nginx'), :if => os[:family] == 'amazon' do
  it { should be_installed }
end


