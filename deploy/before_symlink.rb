rails_env = new_resource.environment["RAILS_ENV"]
activity = (node[:opsworks][:activity] rescue nil)
Chef::Log.info("Precompiling assets for RAILS_ENV=#{rails_env}...")
Chef::Log.info("Opsworks activity=#{activity}...")

#begin
#  from = `cd #{new_resource.deploy_to}/current && git rev-parse HEAD`.strip.gsub(/^#{$/}/, "").gsub(/#{$/}$/, "")
#  force_compile = ENV['COMPILE_ASSETS']
#  Chef::Log.info("Checking for asset changes from: #{from}")
#  cmd = "cd #{release_path} && git diff #{from} -- vendor/assets/ lib/assets/ app/assets/ config/locales/*/*.js.yml"
#  output = []
#  IO.popen(cmd).each do |line|
#    output << line
#  end.close
#  Chef::Log.info("Found #{output.length} changes")
#rescue => e
#  Chef::Log.info("Could not check for asset changes, forcing precompile: #{e.message}")
#  force_compile = true
#end

#if (force_compile) || (output && output.length > 0) || (activity == 'setup')
  run "cd #{release_path} && bundle exec rake assets:precompile RAILS_ENV=#{rails_env}"
#end

#run "cd #{release_path} && bundle exec rake swagger:docs RAILS_ENV=#{rails_env}"
