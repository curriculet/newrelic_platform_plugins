# Monkeypatch of newrelic_plugin/config
require 'erb'
require 'newrelic_plugin/config'

module NewRelic
  module Plugin
    class Config
      attr_reader :options
      # Creates an instance of a configuration object, loading the configuration
      # from the YAML configuration file. Note: this method should not be used
      # directly, rather the global method +config+ should be referenced instead.
      def initialize
        @options = YAML::load(Config.config_yaml) if Config.config_yaml
        # @options = YAML.load_file(Config.config_file) unless @options
        @options = YAML::load(ERB.new(File.read(Config.config_file), 0, '<>').result) unless @options
      end
    end
  end
end