# recipes: deploy.rb

# get own instances + layer name
instance = search('aws_opsworks_instance', 'self:true').first  
layer = search('aws_opsworks_layer', "layer_id:#{instance['layer_ids'].first}").first

# user layer name as app
app_data = search('aws_opsworks_app', "name:#{layer['name']}").first  
fail 'could not find app' unless app_data

# deploy the application
node_app_deploy 'node-app' do  
  ssh_key app_data['app_source']['ssh_key']
  dir ::File.join(node['opsworks-node-app']['basedir'], app_data['name'])
  git_repository app_data['app_source']['url']
  git_revision app_data['app_source']['revision']
  run_cmd node['opsworks-node-app']['run-cmd']
  run_environment app_data['environment']
end  