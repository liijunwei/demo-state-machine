require 'pry'
require "#{ENV['PWD']}/demo01/job"

# rspec spec/test_job.rb

RSpec.describe Job do
  it "should be sleeping" do
    job = Job.new
    expect(true).to eq(job.sleeping?)
  end

  it "should be running" do
    job = Job.new
    job.run
    expect(true).to eq(job.running?)
  end

  it "should be running" do
    job = Job.new
    job.run
    expect(true).to eq(job.running?)
  end
end
