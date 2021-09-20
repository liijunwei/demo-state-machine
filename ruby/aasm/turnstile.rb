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
# For each state, we write out:(分别分析每一个状态)
#     the transition
#     what the next state will be
#     what action to perform (if any)

# State Transition Next State Action

# state     | transition| next_state | action
# ----------|-----------|------------|--------
# locked    | coin      | unlocked   | unlock
# locked    | pass      | locked     | alarm
# unlocked  | coin      | unlocked   | thankyou
# unlocked  | pass      | locked     | lock

# Actions


# https://en.wikipedia.org/wiki/Finite-state_machine
# Considered as a state machine, the turnstile has two possible states: Locked and Unlocked.[4] There are two possible inputs that affect its state: putting a coin in the slot (coin) and pushing the arm (push). In the locked state, pushing on the arm has no effect; no matter how many times the input push is given, it stays in the locked state. Putting a coin in – that is, giving the machine a coin input – shifts the state from Locked to Unlocked. In the unlocked state, putting additional coins in has no effect; that is, giving additional coin inputs does not change the state. However, a customer pushing through the arms, giving a push input, shifts the state back to Locked.

class Turnstile
  include AASM

  aasm do
    after_all_transitions :log_status_change

    # 1. 如果不指定 `initial`, 那么在最先声明的state是初始状态
    # 2. 如果指定 `initial`, 那么初始状态可以不是最先声明的
    state :Locked, initial: true
    state :Unlocked

    event :coin, before: :say_before do
      error do |e|
        log_error(e)
      end
      transitions from: :Locked, to: :Unlocked
    end

    event :pass do
      error do |e|
        log_error(e)
      end

      # 两种注册回调的方式
      before {say_before}
      after {say_after}
      transitions from: :Unlocked, to: :Locked
    end
  end

  def say_before
    puts "hi before... (event: #{aasm.current_event})"
  end

  def say_after
    puts "hi after... (event: #{aasm.current_event})"
  end

  def testing?
    ENV['APPLICATION_MODE'] == 'test'
  end

  def log_status_change
    testing? and return

    puts "> #{Time.now} changing from #{aasm.from_state} to #{aasm.to_state} (event: #{aasm.current_event})"
  end

  def log_error(e)
    testing? and raise e

    puts "> #{Time.now} error happened..."
    raise e
  end
end
