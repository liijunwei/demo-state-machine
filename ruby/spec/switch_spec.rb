require "#{ENV['PWD']}/demo01/switch"

RSpec.describe Switch do
  it "should have initial state of `off`" do
    expect(:off).to eq(Switch.new.aasm.current_state)
  end
  it "should be off" do
    switch = Switch.new
    expect(true).to eq(switch.off?)
  end
  it "should be off, and can switch_on" do
    switch = Switch.new
    expect(true).to eq(switch.off?)
    expect(true).to eq(switch.switch_on)
    expect(true).to eq(switch.on?)
  end
  it "should be off, and can not switch_off again" do
    switch = Switch.new
    expect(true).to eq(switch.off?)
    expect {switch.switch_off}.to raise_error(AASM::InvalidTransition)
  end
  it "should be on" do
    switch = Switch.new
    switch.switch_on
    expect(true).to eq(switch.on?)
  end
  it "should be on, and can not switch_on again" do
    switch = Switch.new
    switch.switch_on
    expect(true).to eq(switch.on?)
    expect {switch.switch_on}.to raise_error(AASM::InvalidTransition)
  end
end
