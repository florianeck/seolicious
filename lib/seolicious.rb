module Seolicious
  

  mattr_reader :yaml_config
  
  
  def self.config_file_path
    "#{Rails.root}/config/seolicious.yml"
  end
  
  def self.example_config_path
    File.expand_path("../../config/seolicious.example.yml", __FILE__) 
  end
    
  def self.config_from_yaml
    return self.yaml_config if self.yaml_config.present?

    if File.exists?(config_file_path)
      @@yaml_config = YAML::load(File.open(config_file_path).read)
    else
      raise LoadError, "Cant find config file under #{config_file_path}"
    end
  end

  
end

require "seolicious/engine"
require "seolicious/controller_ext"

require 'carrierwave'