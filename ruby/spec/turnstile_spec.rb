require_relative "../aasm/turnstile"

RSpec.describe Turnstile do
  it "should have initial state of `Locked`" do
    expect(Turnstile.new.aasm.current_state).to eq(:Locked)
  end
  it "should be locked" do
    turnstile = Turnstile.new
    expect(turnstile.Locked?).to eq(true)
  end
  it "may coin" do
    turnstile = Turnstile.new
    expect(turnstile.may_coin?).to eq(true)
  end
end
