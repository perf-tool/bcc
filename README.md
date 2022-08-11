# bcc
this is a ubuntu based compile of [bcc](https://github.com/iovisor/bcc)
## install prerequisites
### ubuntu
```bash
apt-get install -y linux-tools-$(uname-r) linux-headers-$(uname-r)
```
### fedora
```bash
dnf install -y kernel-devel-$(uname-r)
```
## run
```bash
docker run --privileged -it --rm -v /lib/modules:/lib/modules:ro -v /usr/src:/usr/src:ro -v /etc/localtime:/etc/localtime:ro -v /sys/kernel:/sys/kernel:ro perftool/bcc:latest bash
```
