ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

require 'bundler/setup'
Bundler.require(:default)

class Switch
  include AASM

  aasm do
    state :closed, initial: true
    state :open

    event :switch_on do
      transitions from: :closed, to: :open
    end

    event :switch_off do
      transitions from: :open, to: :closed
    end
  end
end
