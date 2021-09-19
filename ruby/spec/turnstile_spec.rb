require "#{ENV['PWD']}/demo01/turnstile"

RSpec.describe Turnstile do
  it "should have initial state of `Locked`" do
    expect(:Locked).to eq(Turnstile.new.aasm.current_state)
  end
  it "should be locked" do
    turnstile = Turnstile.new
    expect(true).to eq(turnstile.Locked?)
  end
end
