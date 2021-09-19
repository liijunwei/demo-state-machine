require_relative "../aasm/turnstile"

RSpec.describe Turnstile do
  it "should have initial state of `Locked`" do
    expect(Turnstile.new.aasm.current_state).to eq(:Locked)
  end
  it "should be locked" do
    turnstile = Turnstile.new
    expect(turnstile.Locked?).to be true
  end
  it "may coin" do
    turnstile = Turnstile.new
    expect(turnstile.may_coin?).to be true
  end
  it "shoule be unlocked" do
    turnstile = Turnstile.new
    turnstile.coin
    expect(turnstile.Unlocked?).to be true
  end
  it "shoule not be coined again" do
    turnstile = Turnstile.new
    turnstile.coin
    expect {turnstile.coin}.to raise_error(AASM::InvalidTransition)
  end
  it "shoule be passed" do
    turnstile = Turnstile.new
    expect(turnstile.Locked?).to be true
    turnstile.coin
    expect(turnstile.Unlocked?).to be true
    turnstile.pass
    expect(turnstile.Locked?).to be true
  end
  it "shoule not be passed again" do
    turnstile = Turnstile.new
    turnstile.coin
    turnstile.pass
    expect {turnstile.pass}.to raise_error(AASM::InvalidTransition)
  end
end
