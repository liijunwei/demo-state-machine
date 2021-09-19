require 'aasm'

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
