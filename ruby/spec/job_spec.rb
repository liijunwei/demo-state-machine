require 'pry'
require "#{ENV['PWD']}/demo01/job"

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

  it "is running, and should not be run again" do
    job = Job.new
    job.run
    expect(true).to eq(job.running?)
    expect {job.run}.to raise_error(AASM::InvalidTransition)
  end
end
