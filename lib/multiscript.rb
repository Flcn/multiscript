require_relative "multiscript/version"
require_relative "multiscript/packager"
require_relative "multiscript/compilers"

module MultiScript
  class << self
    def compress(params)      
      packages = get_packages(params)
      codez = packages_to_string(packages)
      if params[:minify]
        codez = minify codez
      end
      unless params[:out_type]
        params[:out_type] = 'string'
      end
      if params[:out_type] == 'file' || params[:out_type] == 'dir'  
        params[:out_folder] ||= 'source.js'
        write_file(codez, params[:out_folder], params[:out_file])
      else
        return codez
      end
    end 
    
    #TODO validate code
    private
    
    def get_packages(params)
      if params[:source_type] == 'config'
         packages = MultiScript::Packager.package_config(params[:source_folder], params[:config_file])
      else
        raise 'not coded yet'
      end
      packages
    end
    
    def packages_to_string(packages)
      code = []
      code << "(function(){"
      code << "  #{MultiScript::CoffeeCompiler.compile(packages[:coffee])}"
      code << "  #{packages[:js]}"
      code << "}).call(this);"
      code.join("\n")
    end
    
    def write_file(codez, out_folder, out_file)
      File.open(File.join(out_folder, out_file), 'w') do |file| 
        file.write(codez)
      end
    end
    
    def minify(source)
      require "uglifier"
      Uglifier.compile(source)
    end
    
  end # class << self
end # module MultiScript