<h1 align=center>tachylestia-shell</h1>

An [Tachyon](https://umamusu.wiki/Agnes_Tachyon)-themed [caelestia-shell](https://github.com/caelestia-dots/shell). Designed by a tachyon fan.

*Please don't judge, this is like the most basic changes you can make with your caelestia-shell*

<div align=center>

![GitHub last commit](https://img.shields.io/github/last-commit/summerwya/tachylestia-shell?style=for-the-badge&labelColor=101418&color=9ccbfb)
![GitHub Repo stars](https://img.shields.io/github/stars/summerwya/tachylestia-shell?style=for-the-badge&labelColor=101418&color=b9c8da)
![GitHub repo size](https://img.shields.io/github/repo-size/summerwya/tachylestia-shell?style=for-the-badge&labelColor=101418&color=d3bfe6)
[![Discord invite](https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fdiscordapp.com%2Fapi%2Finvites%Hs79BraGxK%3Fwith_counts%3Dtrue&query=approximate_member_count&style=for-the-badge&logo=discord&logoColor=ffffff&label=discord&labelColor=101418&color=96f1f1&link=https%3A%2F%2Fdiscord.gg%Hs79BraGxK)](https://discord.com/invite/Hs79BraGxK)

Please check out the [original](https://github.com/caelestia-dots/shell) caelestia-shell

</div>

https://github.com/user-attachments/assets/0840f496-575c-4ca6-83a8-87bb01a85c5f

## Components

-   Widgets: [`Quickshell`](https://quickshell.outfoxxed.me)
-   Window manager: [`Hyprland`](https://hyprland.org)
-   Dots: [`caelestia`](https://github.com/caelestia-dots)

## Installation (Arch Linux)

This is not installable with `yay`. Follow the steps below to use:

### Step 1

- Install [caelestia](https://github.com/caelestia-dots/caelestia)

### Step 2

Clone this repo then build

```shell
cd $XDG_CONFIG_HOME/quickshell
git clone https://github.com/summerwya/tachylestia-shell.git tachylestia

cd caelestia
cmake -B build -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/
cmake --build build
sudo cmake --install build
```

### Step 3

Done:3 (Idk, i think that's what i did)

## TODO

- Does using `qsTr` even do anything when the dialogue is randomized?
- Add more images
- Instead of replacing the resource gauges in the lock screen with just images of tachyon, just make the backgrounds of the gauges be tachyon
- Ship with a default wallpaper?

## Credits

- The [Caelestia-dots](https://github.com/caelestia-dots/caelestia) rice.
- Agnes Tachyon is from [Uma musume: Pretty Derby](https://umamusume.com/).

## Stonks 📈

<a href="https://www.star-history.com/#summerwya/tachylestia-shell&Date">
 <picture>
   <source media="(prefers-color-scheme: dark)" srcset="https://api.star-history.com/svg?repos=summerwya/tachylestia-shell&type=Date&theme=dark" />
   <source media="(prefers-color-scheme: light)" srcset="https://api.star-history.com/svg?repos=summerwya/tachylestia-shell&type=Date" />
   <img alt="Star History Chart" src="https://api.star-history.com/svg?repos=summerwya/tachylestia-shell&type=Date" />
 </picture>
</a>
