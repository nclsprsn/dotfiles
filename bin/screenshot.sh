#!/bin/sh
scrot "/tmp/src_%Y-%m-%d_%H-%M-%S.png" -s -e 'xclip -selection clipboard -t "image/png" < $f'