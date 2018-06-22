namespace :seolicious do
  
  namespace :install do
    
    desc "Copy config files"
    task :config do
      if File.exists?(Seolicious.config_file_path)
        raise "Config file already exists!"
      else
        FileUtils.cp(
          Seolicious.example_config_path, 
          Seolicious.config_file_path
        )
      end
    end
    
  end
  
end