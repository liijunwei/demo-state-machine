require 'aasm'

class Job
  include AASM

  aasm do
    state :sleeping, initial: true
    state :running, :cleaning

    event :run do
      # before {puts "Before state: #{aasm.current_state}"}
      # after {puts "After state: #{aasm.current_state}"}
      transitions from: :sleeping, to: :running
    end

    event :clean do
      transitions from: :running, to: :cleaning
    end

    event :sleep do
      transitions from: [:running, :cleaning], to: :sleeping
    end
  end
end
