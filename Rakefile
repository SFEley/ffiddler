require 'rubygems'
require 'rbconfig'
require 'rake/clean'

# require 'date'
# require 'fileutils'


LIBEXT = case RbConfig::CONFIG['host_os'].downcase
  when /darwin/
    "dylib"
  when /mswin|mingw/
    "dll"
  else
    RbConfig::CONFIG['DLEXT']
  end

CPU = case RbConfig::CONFIG['host_cpu'].downcase
  when /i[3456]86/
    # Darwin always reports i686, even when running in 64bit mode
    if RbConfig::CONFIG['host_os'] =~ /darwin/ && 0xfee1deadbeef.is_a?(Fixnum)
      "x86_64"
    else
      "i386"
    end

  when /amd64|x86_64/
    "x86_64"

  when /ppc64|powerpc64/
    "powerpc64"

  when /ppc|powerpc/
    "powerpc"

  when /^arm/
    "arm"

  else
    RbConfig::CONFIG['host_cpu']
  end

OS = case RbConfig::CONFIG['host_os'].downcase
  when /linux/
    "linux"
  when /darwin/
    "darwin"
  when /freebsd/
    "freebsd"
  when /openbsd/
    "openbsd"
  when /sunos|solaris/
    "solaris"
  when /mswin|mingw/
    "win32"
  else
    RbConfig::CONFIG['host_os'].downcase
  end

GMAKE = system('which gmake >/dev/null') && 'gmake' || 'make'

LIBTEST = "build/libtest.#{LIBEXT}"

TEST_DEPS = [ LIBTEST ]
desc "Run all specs"
task :specs => TEST_DEPS do
  sh %{#{Gem.ruby} -w -S rspec #{Dir["spec/ffi/*_spec.rb"].join(" ")} -fs --color}
end
desc "Run rubinius specs"
task :rbxspecs => TEST_DEPS do
  sh %{#{Gem.ruby} -w -S rspec #{Dir["spec/ffi/rbx/*_spec.rb"].join(" ")} -fs --color}
end

CLOBBER.include 'build'

task :distclean => :clobber

desc "Build the native test lib"
file "build/libtest.#{LIBEXT}" => FileList['spec/libtest/**/*.[ch]'] do
  sh %{#{GMAKE} -f spec/libtest/GNUmakefile CPU=#{CPU} OS=#{OS} }
end

desc "Build test helper lib"
task :libtest => "build/libtest.#{LIBEXT}"

desc "Test the extension"
task :test => [ :specs, :rbxspecs ]

task 'spec:run' => TEST_DEPS
task 'spec:specdoc' => TEST_DEPS

task :default => :specs
