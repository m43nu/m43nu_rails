require 'fileutils'

module M43nuRailsHelpers
  APP_NAME = 'test_project'

  def remove_project_directory
    FileUtils.rm_rf(project_path)
  end

  def create_project(options = nil)
    cmd "#{m43nu_rails_bin} #{APP_NAME} #{options}"
  end

  def run_rake
    Dir.chdir(project_path) do
      cmd 'bundle exec rake db:create'
      cmd 'bundle exec rake db:migrate'
      cmd 'bundle exec rake db:test:prepare'
      cmd 'bundle exec rake'
    end
  end

  def cmd(command)
    system "#{command}"
  end

  def project_path
    @project_path ||= Pathname.new("#{root_path}/#{APP_NAME}")
  end

  def m43nu_rails_bin
    File.join(root_path, 'bin', 'm43nu_rails')
  end

  def root_path
    File.expand_path('../../../', __FILE__)
  end

  def assert_exist_file(path)
    assert File.exists?(project_file(path))
  end

  def assert_file_have_content(path, content)
    assert File.read(project_file(path)).include?(content)
  end

  def project_file(path)
    File.join(project_path, path)
  end
end
