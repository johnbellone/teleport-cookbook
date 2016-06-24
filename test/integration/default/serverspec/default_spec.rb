require 'serverspec'
set :backend, :exec

describe file('/opt/teleport/1.0.0') do
  it { should be_directory }
end

describe file('/opt/teleport/1.0.0/teleport') do
  it { should be_file }
  it { should be_executable }
end

describe file('/opt/teleport/1.0.0/tsh') do
  it { should be_file }
  it { should be_executable }
end

describe file('/opt/teleport/1.0.0/tctl') do
  it { should be_file }
  it { should be_executable }
end
