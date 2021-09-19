require_relative "../aasm/login_form"

RSpec.describe LoginForm do
  it "should have initial state of `start`" do
    expect(LoginForm.new.aasm.current_state).to eq(:start)
  end
  it "should be start" do
    login_form = LoginForm.new
    expect(login_form.start?).to be true
  end
end
