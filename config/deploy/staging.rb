# server-based syntax
# ======================
# Defines a single server with a list of roles and multiple properties.
# You can define all roles on a single server, or split them:

server "18.189.184.204", user: "ubuntu", roles: %w{app db web}

set :stage, :staging
set :rails_env, :staging

set :deploy_to, "/var/www/SocialFreak"

set :branch, :staging