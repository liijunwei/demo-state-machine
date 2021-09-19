# https://github.com/aasm/aasm#rspec
# AASM provides some matchers for RSpec:

require_relative "../aasm/job"

RSpec.describe Job do
  it "should have initial state of `sleeping`" do
    expect(Job.new.aasm.current_state).to eq(:sleeping)
  end
  it "should be sleeping" do
    job = Job.new
    expect(job.sleeping?).to be true
  end

  it "should be running" do
    job = Job.new
    job.run
    expect(job.running?).to be true
  end

  it "is running, and should not be run again" do
    job = Job.new
    job.run
    expect(job.running?).to be true
    expect {job.run}.to raise_error(AASM::InvalidTransition)
  end

  it "is running, and is may sleep" do
    job = Job.new
    job.run
    expect(job.running?).to be true
    expect(job.may_sleep?).to be true
  end

  it "is sleeping, and may run" do
    job = Job.new
    expect(job.sleeping?).to be true
    expect(job.may_run?).to be true
  end
end
