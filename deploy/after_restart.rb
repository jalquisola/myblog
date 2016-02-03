rails_env = new_resource.environment["RAILS_ENV"]
application_name = node[:opsworks][:applications].first[:slug_name]

if (node && node[:opsworks] && node[:opsworks][:activity] == 'deploy')
  #rollbar_deploy_environments = %w(staging production)
  #if rollbar_deploy_environments.include?(rails_env)
  #  # Notify Rollbar of deploy
  #  Chef::Log.info("Notifying Rollbar of deploy")
  #  Chef::Log.info(node[:deploy].inspect)
  #  rollbar_token = node[:deploy][application_name][:environment]['ROLLBAR_ACCESS_TOKEN']
  #  Chef::Log.debug("curl https://api.rollbar.com/api/1/deploy/ -F access_token=#{rollbar_token} -F environment=#{rails_env} -F revision=#{scm_provider.revision_slug}")
  #  `curl https://api.rollbar.com/api/1/deploy/ -F access_token=#{rollbar_token} -F environment=#{rails_env} -F revision=#{scm_provider.revision_slug}`
  #else
  #  Chef::Log.info("Did not notify Rolls of deploy as environment #{rails_env} was not in #{rollbar_deploy_environments.inspect}")
  #end

  ## Newrelic Deploy Notice
 #newrelic_deploy_environments = %w(staging production)
 #if newrelic_deploy_environments.include?(rails_env)
  #  # Notify RPM of deploy
  # Chef::Log.info("Notifying Newrelic of deploy")
  #  #sudo "gem install newrelic_rpm"
 #begin
 # sudo "cd #{release_path} && bundle exec newrelic deployments --environment=#{rails_env} --revision=#{scm_provider.revision_slug} &"
 #   rescue
 #   end
 #else
 #   Chef::Log.info("Did not notify Newrelic of deploy as environment #{rails_env} was not in #{newrelic_deploy_environments.inspect}")
 # end
end
