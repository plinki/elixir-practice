defmodule Carrot do
  import Poison
  @carrot_dir "/carrot"
  @conf_name "/conf"

  def main do
    capture_home_dir()
    capture_config_dir()
    encode_dirs()
  end

  def capture_home_dir do
    System.user_home()
  end

  def capture_config_dir(path \\ "#{capture_home_dir()}/.config") do
    {path, path <> @carrot_dir <> @conf_name}
  end

  def encode_dirs do
    {config_folder, conf_file} = capture_config_dir()
    File.write!(conf_file, Poison.encode!(File.ls!(config_folder)), [:binary])
  end
end
