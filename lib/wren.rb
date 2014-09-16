require "wren/version"
require "thor"
require "active_support/core_ext/string"

module Wren
  class Generator < Thor::Group
    desc "Creates a simple project directory for a new Ruby program."

    include Thor::Actions

    argument :name

    def self.source_root
      File.dirname(__FILE__)
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
      if yes? "Create an executable file?"
        template "templates/bin.tt", "#{name}/bin/#{name}"
        chmod "#{name}/bin/#{name}", 0755
      end
    end
  end
end
