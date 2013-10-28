#
# This file was adapted into ffiddler from the Ruby FFI gem
# (https://github.com/ffi/ffi)
# For licensing, see LICENSE.SPECS
#
require 'rubygems'
require 'bundler/setup'
require 'rbconfig'

if RUBY_PLATFORM =~/java/
  libdir = File.expand_path(File.join(File.dirname(__FILE__), "..", "..", "lib"))
  $:.reject! { |p| p == libdir }
else
  $:.unshift File.join(File.dirname(__FILE__), "..", "..", "lib")
end

require "ffi"

module TestLibrary
  PATH = "build/libtest.#{FFI::Platform::LIBSUFFIX}"
  def self.force_gc
    if RUBY_PLATFORM =~ /java/
      java.lang.System.gc
    elsif defined?(RUBY_ENGINE) && RUBY_ENGINE == 'rbx'
      GC.run(true)
    else
      GC.start
    end
  end
end
module LibTest
  extend FFI::Library
  ffi_lib TestLibrary::PATH
end
