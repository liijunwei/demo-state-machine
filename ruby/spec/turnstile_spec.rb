require_relative "../aasm/turnstile"

RSpec.describe Turnstile do
  it "should have initial state of `Locked`" do
    expect(:Locked).to eq(Turnstile.new.aasm.current_state)
  end
  it "should be locked" do
    turnstile = Turnstile.new
    expect(true).to eq(turnstile.Locked?)
  end
  it "may coin" do
    turnstile = Turnstile.new
    expect(turnstile.may_coin?).to eq(true)
  end
end
