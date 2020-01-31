---
title: 'Building a timelapse out of images'
---
No cropping.
```bash
$ ffmpeg -r 24 -pattern_type glob -i '*.JPG' -i IMG_%04d.JPG -s hd1080 -vcodec libx264 timelapse.mp4
```

Crop to 640x426 — works fairly well for social media.
```bash
ffmpeg -r 40.04 -i %03d.jpg -vf "crop=640:426:0:0" -vcodec libx264 -preset veryslow -tune stillimage -crf 23 -r 29.97 -pix_fmt yuv420p timelapse.mp4
```

| `-r 40.04`               | input framerate — choose based on number of images and desired length |
| `-i %03d.jpg`            | input file pattern                                                    |
| `-vf "crop=640:426:0:0"` | crop (height:width:startx:starty)                                     |
| `-vcodec libx264`        | codec                                                                 |
| `-preset veryslow`       | very slow (speed vs quality)                                          |
| `-tune stillimage`       | for timelapses                                                        |
| `-crf 23`                | 23 is default, 0 is lossless                                          |
| `-r 29.97`               | final framerate — fixed                                               |
| `-pix_fmt yuv420p`       | output format — required for some stupid players                      |
| `timelapse.mp4`          | output name                                                           |

More on the [official wiki](https://trac.ffmpeg.org/wiki).
