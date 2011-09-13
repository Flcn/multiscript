Can compile multipl coffee and js file together, compress it ...

###Sample

```ruby
require 'multiscript'
sources = File.expand_path('../js/sources', __FILE__)

source_str = MultiScript.compress({
  :source_type   => 'config',
  :source_folder => sources, 
  :config_file   => 'config.yaml',
  :out_type      => 'string',
  :minify        => falses
})
````

