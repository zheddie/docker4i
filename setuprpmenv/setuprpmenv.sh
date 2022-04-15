#! /QOpenSys/usr/bin/bsh
rm -rf /qopensys/pkgs /qopensys/var/lib/rpm /qopensys/var/lib/yum /qopensys/cache/yum /qopensys/etc/yum/repos.d
system "QSH CMD('touch -C 819 /tmp/bootstrap.log; /QOpenSys/usr/bin/ksh /tmp/bootstrap.sh > /tmp/bootstrap.log 2>&1')"
