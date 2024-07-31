from pytube import YouTube
import sys
import subprocess

for arg in sys.argv[1:]:
    print(arg)
    print(f"Dowloading: {arg}")
    path = YouTube(arg, use_oauth=True, allow_oauth_cache=True).streams.filter(only_audio=True).get_highest_resolution().download()
    new_path = path.replace(".mp4", ".mp3")
    print(f"Converting: {arg}")
    subprocess.run(f"ffmpeg -i \"{path}\" \"{new_path}\"",shell=True,capture_output=True)
