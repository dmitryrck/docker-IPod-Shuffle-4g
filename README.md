# Generate the content

First create an empty directory to your _iPod_ files, e. g.:

    % mkdir ~/iPod

Then create a directory named `music` to _place your songs_:

    % mkdir ~/iPod/music

Place all your songs in `/music`.

Generate the content based on iPod directory

    % docker run -u $UID -w /ipod -v ~/iPod:/ipod dmitryrck/ipod-shuffle-4g -u -t -v /ipod

And *sync* all content of `~/iPod` to your iPod.

# Utils

## Mount

    # mount -t vfat /dev/disk/by-uuid/67C3-DCC4 -o uid=1000,gid=1000 /mnt

## Create playlist for each directory

    % find music -type f -iname '*m3u*' -exec rm '{}' \;

    % find music -iname '*.mp3' \
      -execdir bash -c 'file="{}"; printf "%s\n" "${file##*/}" >> "${PWD##*/}.m3u"' \;

## Replace space with _

    perl-rename 'y/ /_/' *

## Rename to lowcase

    zmv '(*)' '${(L)1}'

or

    perl-rename 'y/A-Z/a-z/' *

## Convert m4a to mp3

    % ffmpeg -i filename.m4a -acodec libmp3lame -ab 320k filename.mp3
