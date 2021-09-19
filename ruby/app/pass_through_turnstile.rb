require_relative '../aasm/turnstile'

def welcome
  puts
  puts "Welcome to my happly land, you have to insert a coin to pass..."
end

def hint
  puts
  print "Please enter coin/pass, exit to abort: "
end

def smile
  ":)"
end

def farewell
  puts
  puts "Welcome back."
  puts
end

at_exit { farewell }

welcome

turnstile = Turnstile.new

loop do
  hint
  event = gets.strip

  case event
  when 'coin'
    turnstile.coin && puts("Please pass through #{smile}")
  when 'pass'
    turnstile.pass && puts("You passed, enjoy your journal #{smile}")
  when 'exit'
    break
  else
    hint
  end
rescue AASM::InvalidTransition => e
  require 'pry'
  # binding.pry
  puts e.inspect
end

