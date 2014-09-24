require "thor"
require "active_support/core_ext/string"
require "pathname"
require "minitest"

module Wren
  class Generator < Thor::Group
    include Thor::Actions

    argument :name
    class_option :exec => true, :aliases => "-x"

    def self.source_root
      Pathname.new(File.dirname(__FILE__)) + ".."
    end

    def create_rakefile
      template "templates/Rakefile.tt", "#{name}/Rakefile"
    end

    def create_gemfile
      template "templates/Gemfile.tt", "#{name}/Gemfile"
    end

    def create_lib_file
      template "templates/lib.tt", "#{name}/lib/#{name}.rb"
    end

    def create_test_file
      template "templates/test.tt", "#{name}/test/#{name}_test.rb"
    end

    def create_bin_file
      return unless options[:exec]
      template "templates/bin.tt", "#{name}/bin/#{name}"
      chmod "#{name}/bin/#{name}", 0755
    end
  end
end
