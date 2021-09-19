require "#{ENV['PWD']}/aasm/login_form"

RSpec.describe LoginForm do
  it "should have initial state of `start`" do
    expect(:start).to eq(LoginForm.new.aasm.current_state)
  end
  it "should be start" do
    login_form = LoginForm.new
    expect(true).to eq(login_form.start?)
  end
end
