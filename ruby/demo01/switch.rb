ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

require 'bundler/setup'
Bundler.require(:default)

class Switch
  include AASM

  aasm do
    state :off, initial: true
    state :on

    event :switch_on do
      transitions from: :off, to: :on
    end

    event :switch_off do
      transitions from: :on, to: :of
    end
  end
end
