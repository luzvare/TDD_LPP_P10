lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "huellanutricional/version"

Gem::Specification.new do |spec|
  spec.name          = "huellanutricional"
  spec.version       = Huellanutricional::VERSION
  spec.authors       = ["Luciana Varela"]
  spec.email         = ["alu0101106175@ull.edu.es"]

  spec.summary       = %q{Buscamos conseguir el cálculo del impacto ambiental diario de una persona..}
  spec.description   = %q{Disponemos de alimentos, cada uno de ellos tiene unas proteínas, carbohidratos, lípidos y aportan unas emisiones de gases y emplean un terreno para ser creados. Con estos datos buscamos calcular el impacto ambiental que aporta cada uno de ellos a una dieta.}
  spec.homepage      = "https://github.com/Luz-Vare/TDD_LPP_P10.git"

  spec.metadata["allowed_push_host"] = "https://github.com/Luz-Vare/TDD_LPP_P10.git"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/Luz-Vare/TDD_LPP_P10.git"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "yard"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "guard-bundler"
  spec.add_development_dependency "coveralls"
end
