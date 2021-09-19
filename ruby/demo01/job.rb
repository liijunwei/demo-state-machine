ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

require 'bundler/setup'
Bundler.require(:default)

class Job
  include AASM
  def initialize(state = :sleeping)
    @state = state
  end

  aasm do
    state :sleeping, initial: true
    state :running, :cleaning

    event :run do
      before {puts "Before state: #{aasm.current_state}"; @state = aasm.current_state}
      after {puts "After state: #{aasm.current_state}"; @state = aasm.current_state}
      transitions from: :sleeping, to: :running
    end

    event :clean do
      transitions from: :running, to: :cleaning
    end

    event :sleep do
      transitions from: [:running, :cleaning], to: :sleeping
    end
  end

  def state
    @state
  end
end
