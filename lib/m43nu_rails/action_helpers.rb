module M43nuRails
  module ActionHelpers

    def action_mailer_host(rails_env, host)
      host_config = "config.action_mailer.default_url_options = { host: '#{host}' }"
      configure_environment(rails_env, host_config)
    end

    def configure_environment(rails_env, config)
      inject_into_file("config/environments/#{rails_env}.rb",
                       "\n\n  #{config}", before: "\nend")
    end

    def replace_in_file(relative_path, find, replace)
      path = File.join(destination_root, relative_path)
      contents = IO.read(path)
      unless contents.gsub!(find, replace)
        raise "#{find.inspect} not found in #{relative_path}"
      end
      File.open(path, "w") { |file| file.write(contents) }
    end

  end
end
