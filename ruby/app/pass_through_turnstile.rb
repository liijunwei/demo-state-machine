require_relative '../aasm/turnstile'

turnstile = Turnstile.new

def welcome
  puts
  puts "Welcome to my happly land, you have to insert a coin to pass..."
end

def hint
  puts
  print "please enter coin/pass, exit to exit the program: "
end

def farewell
  puts
  puts "Welcome back."
  puts
end

at_exit { farewell }

welcome

loop do
  hint
  event = gets.strip

  case event
  when 'coin'
    turnstile.coin
    puts "turnstile unlocked, please pass"
  when 'pass'
    turnstile.pass
    puts "you passed, and turnstile locked, enjoy your journal"
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

