require 'aasm'

# http://smc.sourceforge.net/slides/SMC_Tutorial.pdf
#
# Description of the normal operation of a turnstile(转门`turn-style`):
#
# 1. Turnstile initially locked
# 2. A coin or ticket is inserted (event)
# 3. Triggers action: turnstile unlocks
# 4. A person passes through turnstile (event)
# 5. Triggers action: turnstile locks again

# The state pattern respects the OCP:
# software entities should be open for extension but closed for modification

# state machine
# A state machine is an alternative way of modeling program state:
# Instead of defining independent variables, a machine is crafted specifically
# to handle what states are possible, and when a machine is a given state,
# what next state is allowed. Those five independent boolean variables are replaced
# with a single state machine which intrinsically can only be in valid states.

# States
# 每一位(bit)的状态: 0 或 1, 多位上的组合, 可能性是无限多种
# defination: `the particular condition that someone or something is in at a specific time.`
# defination: `A state is a description of the status of a system that is waiting to execute a transition.`
# defination: `Program state is the set of all variables in a program and their values at any point in time [see Wikipedia](https://en.wikipedia.org/wiki/State_(computer_science)#Program_state)`

# Transitions
#
# For each state, we write out:(对每一个状态分别分析)
#     the transition
#     what the next state will be
#     what action to perform (if any)

# Actions



class Turnstile
  include AASM

  aasm do
    state :Locked, initial: true
    state :Unlocked

    event :coin do
      transitions from: :Locked, to: :Unlocked
    end

    event :pass do
      transitions from: :Unlocked, to: :Locked
    end
  end
end
