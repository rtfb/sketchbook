# Build a Raspberry Pi SD card image on Intel Linux host

Host requirements:
`sudo modprobe binfmt_misc`
`docker run --privileged --rm tonistiigi/binfmt --install arm64,arm`

## Build

`make build-image`
`make build`

And it's done:
```
$ ls -lh work/deploy-2026-03-07/deb12-arm64-min.img
-rw-r--r-- 1 root root 1.5G Mar  7 15:31 work/deploy-2026-03-07/deb12-arm64-min.img
```
