---
title: "Combine audio and video"
---
Put a video file and an audio file together.
```bash
$ ffmpeg -i video-file.mp4 -i audio-file.mp4 -codec copy -shortest mixed.mp4
```
- `-codec copy` means do not reencode anything, just mix as it is
- `-shortest` means the result will be as long as the shortest of the two
