from pytube import YouTube
import sys

for arg in sys.argv[1:]:
    print(arg)
    YouTube(arg).streams.filter(only_audio=True).first().download()
