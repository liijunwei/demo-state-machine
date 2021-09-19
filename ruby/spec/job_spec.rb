require "#{ENV['PWD']}/demo01/job"

RSpec.describe Job do
  it "should have initial state of `sleeping`" do
    job = Job.new
    expect(:sleeping).to eq(job.aasm.current_state)
  end
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

  it "is running, and is may sleep" do
    job = Job.new
    job.run
    expect(true).to eq(job.running?)
    expect(true).to eq(job.may_sleep?)
  end

  it "is sleeping, and may run" do
    job = Job.new
    expect(true).to eq(job.sleeping?)
    expect(true).to eq(job.may_run?)
  end
end
