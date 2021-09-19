require "#{ENV['PWD']}/demo01/switch"

RSpec.describe Switch do
  it "should be off" do
    switch = Switch.new
    expect(true).to eq(switch.off?)
  end
  it "should be on" do
    switch = Switch.new
    switch.switch_on
    expect(true).to eq(switch.on?)
  end
end
