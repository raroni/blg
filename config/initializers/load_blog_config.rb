proc do
  path = File.join(File.dirname(__FILE__), '..', 'blog.yml')
  tree = YAML.load_file path
  
  BlgConfig = tree['default'].merge(tree[Rails.env]).symbolize_keys
end.call
