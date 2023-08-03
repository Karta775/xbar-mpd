# xbar-mpd
xbar-mpd is a simple xbar plugin for viewing the state of & controlling mpd. Since xbar works with limited space, the script will convert any long-artist names into an acronym ("King Gizzard and the Lizard Wizard" becomes "KGLW").

### Requirements
There are a few requirements:
* xbar
* mpd
* mpc (MPD CLI client)

To install them all, run the following commands:
```shell
brew install mpd mpc
brew install --cask xbar
```

### Installation
Clone this repository and then enter the following command(s):
```shell
make install
```

### Configuration
The shell script is quite simple and any configurable options are listed at the top of the `mpd-status.1s.sh` file along with comments explaining what each means. Make sure you re-run `make install` after performing any changes.

### Recommendations
I highly recommend using this in conjunction with the excellent [osxmpdkeys](https://github.com/pushrax/osxmpdkeys) which allows you to control mpd with the OSX media keys (play/pause, next, previous).
