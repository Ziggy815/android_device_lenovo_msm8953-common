#!/sbin/sh
baseband="";
for e in $(cat /proc/cmdline);
do
    tmp=$(echo $e | grep "androidboot.baseband" > /dev/null);
    if [ "0" == "$?" ]; then
        baseband=$(echo $e |cut -d":" -f 1 |cut -d"=" -f 2);
    fi
done


# Move variant-specific blobs
mv /vendor/firmware/variant/$baseband/* /vendor/firmware/
rm -rf /vendor/firmware/variant
