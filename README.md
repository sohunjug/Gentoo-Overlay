# sohunjug gentoo overlay

This is my personal gentoo overlay. I use it to customize some ebuilds to my needs.

## Requirements

- Gentoo Linux

## Installation

### Using [standard method](https://wiki.gentoo.org/wiki//etc/portage/repos.conf)

You can setup this overlay by running this one-liner:

    curl -sL https://raw.githubusercontent.com/sohunjug/Gentoo-Overlay/master/sohunjug.conf | sudo tee -a /etc/portage/repos.conf.d/sohunjug.conf

### Using layman

Ensure you have [Layman](http://layman.sourceforge.net/) installed or install it using:

    emerge -v app-portage/layman

Add this overlay this:

    layman -o https://raw.githubusercontent.com/sohunjug/Gentoo-Overlay/master/repositories.xml -f -a sohunjug

---

[![Build Status](https://travis-ci.org/sohunjug/Gentoo-Overlay.svg?branch=master)](https://travis-ci.org/sohunjug/Gentoo-Overlay)
