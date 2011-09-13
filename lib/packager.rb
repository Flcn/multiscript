module MultiScript
  class Packager
    class << self
      def package_folder(folder)
        entires = Dir.entries(folder)
        coffee = entires.select{ |ent| ent.end_with?('.coffee')}
        js = entires.select{ |ent| ent.end_with?('.js')}
        package(folder, coffee, js)
      end
      
      def package_config(root_folder, config_file)
        require "yaml" #lazy_load
        config = YAML::load(File.read(File.join(root_folder, config_file)))
        coffee, js = [], []
        config['packages'].each do |package|
          if package.end_with?('.coffee')
            coffee << package
          elsif package.end_with?('.js')
            js << package
          end
        end
        package(root_folder, coffee, js)
      end
      
      private
      def package(folder, coffee, js)       
        coffee_source = ""
        js_source = ""
        coffee.each do |name|
          coffee_source += File.read(File.join(folder, name)) + "\n"
        end
        js.each do |name|
          js_source += File.read(File.join(folder, name)) + "\n"
        end

        {:coffee => coffee_source, :js => js_source}
      end
    end #class << self
  end
end