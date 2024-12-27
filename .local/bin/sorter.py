#!/usr/bin/env python3
import os
import shutil

HOME = os.path.expanduser("~")
DIR_DOWNLOADS = os.path.join(HOME, "Downloads")

dir_music = HOME + "/Music/"
dir_videos = HOME + "/Videos/"
dir_pictures = HOME + "/Pictures/"
dir_archives = HOME + "/docs/archives/"
dir_books = HOME + "/docs/books/"
dir_isos = HOME + "/docs/isos/"
dir_torrents = HOME + "/docs/torrents/"
dir_vpns = HOME + "/docs/vpns/"
dir_codes = HOME + "/projects/codes/"

extensions = [
    [dir_music, ["mp3", "wav"]],
    [dir_videos, ["mp4", "mkv"]],
    [dir_pictures, ["jpg", "jpeg", "png", "gif"]],
    [dir_archives, ["zip", "7z", "tar", "gz"]],
    [dir_books, ["pdf", "txt", "md"]],
    [dir_isos, ["iso", "img", "ova"]],
    [dir_torrents, ["torrent"]],
    [dir_vpns, ["ovpn"]],
    [
        dir_codes,
        [
            "c",
            "cpp",
            "java",
            "py",
            "sh",
            "rs",
            "php",
            "html",
            "css",
            "js",
            "ts",
            "json",
        ],
    ],
]

for root, dir, files in os.walk(DIR_DOWNLOADS):
    for file in files:
        full_path = os.path.join(root, file)
        extension = file.split(".")[-1]

        for ex in extensions:
            if extension.lower() in ex[1]:
                destination = ex[0]
                if not os.path.exists(destination):
                    os.makedirs(destination)
                shutil.move(full_path, os.path.join(destination, file))
                break
