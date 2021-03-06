require 'irb/completion'

require 'rubygems'
require 'wirble'
require 'looksee/shortcuts'
require "ap" # awesome print
require "interactive_editor"

IRB.conf[:AUTO_INDENT]=true

Wirble.init
# Wirble.colorize

def t; b = Time.now; yield; Time.now-b; end

module Enumerable
  def histogram
    h = Hash.new(0)
    # each do |entry|
    self.each do |entry|
      key = nil
      if block_given?
        key = yield entry
      else
        key = entry
      end
      # key = block_given? ? yield(entry) : entry
      h[key] = h[key] + 1
      # h[key] += 1
    end
    return h
    # h
  end
end
