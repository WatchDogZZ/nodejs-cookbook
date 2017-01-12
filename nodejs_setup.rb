# attribute
#   setup attributes
default['opsworks-node-app']['nodejs']['version'] = '6.5.0'  
default['opsworks-node-app']['nodejs']['checksum'] = '...'

#   deploy attributes
default['opsworks-node-app']['basedir'] = '/opt'  
default['opsworks-node-app']['run-cmd'] = 'npm start'


# recipes: setup.rb
node_app_setup 'node-app' do  
  nodejs_version node['opsworks-node-app']['nodejs']['version']
  nodejs_checksum node['opsworks-node-app']['nodejs']['checksum']
end  

