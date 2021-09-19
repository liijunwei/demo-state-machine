require 'aasm'

class LoginForm
  include AASM

  aasm do
    state :start, initial: true
    state :loading, :error, :success

    event :submit do
      transitions from: [:start, :error], to: :loading
    end

    event :resolve do
      transitions from: :loading, to: :success
    end

    event :reject do
      transitions from: :laoding, to: :error
    end
  end
end
