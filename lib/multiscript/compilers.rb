module MultiScript
  class CoffeeCompiler
    class << self
      def compile(source)
        require "coffee-script"
        CoffeeScript.compile(source, :no_wrap => true)
      end
    end #class << self
  end
end