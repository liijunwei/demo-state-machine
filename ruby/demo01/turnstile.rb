ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

require 'bundler/setup'
Bundler.require(:default)

class Turnstile
  include AASM

  aasm do
    state :Locked, initial: true
    state :Unlocked

    event :coin do
      transitions from: :Locked, to: :Unlocked
    end

    event :push do
      transitions from: :Unlocked, to: :Locked
    end
  end
end
