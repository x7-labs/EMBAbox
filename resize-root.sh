#
# turn off swap

set -x
swapoff -a

# disable swap in fstab

sed -i "s/^\(UUID.*swap.*\)/#\1/g" /etc/fstab 

# remove extended partition

parted  /dev/sda rm 2


apt-get install -y cloud-guest-utils
#parted  /dev/sda resizepart 1 400000
# Grow first partition
# https://askubuntu.com/questions/24027/how-can-i-resize-an-ext-root-partition-at-runtime
growpart  /dev/sda 1
mount
mount -o remount,rw /dev/sda1
mount
resize2fs /dev/sda1 
