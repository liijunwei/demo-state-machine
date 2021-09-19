require 'aasm'

# http://smc.sourceforge.net/slides/SMC_Tutorial.pdf
#
# Description of the normal operation of a turnstile(转门`turn-style`):
# 1. Turnstile initially locked
# 2. A coin or ticket is inserted (event)
# 3. Triggers action: turnstile unlocks
# 4. A person passes through turnstile (event)
# 5. Triggers action: turnstile locks again

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
