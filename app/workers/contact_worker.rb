require 'sidekiq'

class ContactWorker
  include Sidekiq::Worker

  def perform(c)
    puts "********"
    puts c
    puts "--------"
    c.deliver
  end
end