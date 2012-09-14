Dir[File.dirname(File.expand_path(__FILE__)) + "/taken/*.rb"].each {|f|
  require f
  # autoload f.match(/(\w+)\.rb/)[1].split("_").collect(&:capitalize).join.to_sym, f
}
