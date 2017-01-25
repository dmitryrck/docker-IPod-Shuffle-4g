from ubuntu

env DEBIAN_FRONTEND noninteractive

run sed -i '/deb-src/d' /etc/apt/sources.list && apt-get update

run apt-get install --yes python git-core python-mutagen libttspico* espeak

run git clone https://github.com/nims11/IPod-Shuffle-4g.git /opt/IPod-Shuffle-4g && \
  ln -s /opt/IPod-Shuffle-4g/ipod-shuffle-4g.py /usr/local/bin

entrypoint [ "ipod-shuffle-4g.py" ]