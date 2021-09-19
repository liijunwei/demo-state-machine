require 'pry'
require "#{ENV['PWD']}/demo01/job"

# rspec spec/test_job.rb

RSpec.describe Job do
  it "should be sleeping" do
    job01 = Job.new
    expect(true).to eq(job01.sleeping?)
  end

  it "should be running" do
    job01 = Job.new
    job01.run
    expect(true).to eq(job01.running?)
  end
end
