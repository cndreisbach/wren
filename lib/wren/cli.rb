require 'wren/generator'

module Wren
  class CLI < Thor

    desc "new PROJECT", "Generates a new Ruby project."
    method_option :exec,
                  :type => :boolean,
                  :default => true,
                  :aliases => "-x",
                  :desc => "Generates an executable file for your project."

    def new(project)
      invoke(Generator, [project], options)
    end
  end
end
