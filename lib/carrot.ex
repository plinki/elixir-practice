defmodule Carrot do
  @carrot_dir "/carrot"
  @conf_name "/conf"
  def main do
    capture_home_dir()
    capture_config_dir()
    encode_dirs()
    get_json()
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

  def get_json() do
    {config_folder, conf_file} = capture_config_dir()

    with {:ok, body} <-
           File.read(conf_file),
         {:ok, json} <-
           Poison.decode!(body),
         do: {:ok, json}
  end
end
