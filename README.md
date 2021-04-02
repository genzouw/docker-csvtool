# csvtool on Docker

[![Docker Cloud build status](https://img.shields.io/docker/cloud/build/genzouw/csvtool?style=for-the-badge)](https://hub.docker.com/r/genzouw/csvtool/)
[![Docker Pulls](https://img.shields.io/docker/pulls/genzouw/csvtool.svg?style=for-the-badge)](https://hub.docker.com/r/genzouw/csvtool/)
[![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/genzouw/csvtool.svg?style=for-the-badge)](https://hub.docker.com/r/genzouw/csvtool/)

[![dockeri.co](https://dockeri.co/image/genzouw/csvtool)](https://hub.docker.com/r/genzouw/csvtool)

## Description

overview

_Please contact me anytime if you have a problem or request! My information is posted at the bottom of this document._

## Requirements

- [Docker](https://www.docker.com/)

## Installation

**You do not need to install !**

## Usage

```bash
$ seq 1 10 | xargs -n 3 echo | sed 's/ /,/g'
1,2,3
4,5,6
7,8,9
10

$ seq 1 10 | xargs -n 3 echo | sed 's/ /,/g' > test.csv

$ docker run --rm -v "$PWD:/workdir" --workdir /workdir genzouw/csvtool transpose ./test.csv
1,4,7,10
2,5,8
3,6,9
```

**I recommend that you set the following alias in `~/.*rc`.**

```bash
$ alias csvtool='docker run --rm -v "$PWD:/workdir" --workdir /workdir genzouw/csvtool'
```

Then you can easily call the command.
( _Note that when using relative paths, you can only specify files under the current directory. For example, you cannot specify `../test.csv`._ )

```bash
$ csvtool transpose ./test.csv
1,4,7,10
2,5,8
3,6,9
```

## Relase Note

| date       | version | note           |
| ---------- | ------- | -------------- |
| 2021-04-03 | 0.1     | first release. |

## License

This software is released under the MIT License, see LICENSE.

## Contribution

## Help

Got a question ?

File a [Github issue](https://github.com/genzouw/docker-csvtool/issues), send an email to [genzouw@gmail.com](mailto:genzouw@gmail.com) or tweet to [@genzouw](https://twitter.com/genzouw) on Twitter.

## Author Information

[genzouw](https://genzouw.com)

- Twitter : @genzouw ( https://twitter.com/genzouw )
- Facebook : genzouw ( https://www.facebook.com/genzouw )
- LinkedIn : genzouw ( https://www.linkedin.com/in/genzouw/ )
- Gmail : genzouw@gmail.com
