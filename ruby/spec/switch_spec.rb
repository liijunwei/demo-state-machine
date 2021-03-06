require_relative "../aasm/switch"

RSpec.describe Switch do
  it "should have initial state of `off`" do
    expect(:off).to eq(Switch.new.aasm.current_state)
  end
  it "should be off" do
    switch = Switch.new
    expect(switch.off?).to be true
  end
  it "should be off, and can switch_on" do
    switch = Switch.new
    expect(switch.off?).to be true
    expect(switch.switch_on).to be true
    expect(switch.on?).to be true
  end
  it "should be off, and can not switch_off again" do
    switch = Switch.new
    expect(switch.off?).to be true
    expect {switch.switch_off}.to raise_error(AASM::InvalidTransition)
  end
  it "should be on" do
    switch = Switch.new
    switch.switch_on
    expect(switch.on?).to be true
  end
  it "should be on, and can not switch_on again" do
    switch = Switch.new
    switch.switch_on
    expect(switch.on?).to be true
    expect {switch.switch_on}.to raise_error(AASM::InvalidTransition)
  end
  it "may switch_on" do
    expect(Switch.new.may_switch_on?).to be true
  end
  it "may switch_off" do
    switch = Switch.new
    switch.switch_on
    expect(switch.may_switch_off?).to be true
  end
  it "may not switch_on" do
    switch = Switch.new
    switch.switch_on
    expect(switch.may_switch_on?).to be false
  end
  it "may not switch_off" do
    expect(Switch.new.may_switch_off?).to be false
  end
end
