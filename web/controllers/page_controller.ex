defmodule CalidMedia.PageController do
  use CalidMedia.Web, :controller

  require IEx

  def index(conn, _params) do
    media_dir = "./priv/static/media"
    file_type = [".mp4", ".mp3", ".avi"]
    {:ok, files} = File.ls(media_dir)
    filtered_files = Enum.filter(files, fn(file) -> String.ends_with?(file, file_type) end)
    struct_files = Enum.map(filtered_files, fn(file) -> %CalidMedia.Media{filename: file} end)
    # IEx.pry
    render conn, "index.html", files: struct_files
  end

  def show(conn, %{"filename" => filename}) do
    render conn, "show.html", filename: filename
  end
end
