module Seolicious
  class Engine < Rails::Engine
    engine_name 'seolicious'
    
    initializer 'setup config' do
      YAML::load(File.open(Seolicious.example_config_path).read).keys.each do |setting|
        Seolicious.send(:mattr_accessor, setting)
        Seolicious.send("#{setting}=", Seolicious.config_from_yaml.fetch(setting, nil))
      end
      
      ApplicationController.send(:include, Seolicious::ControllerExt)
    end
  end
end

