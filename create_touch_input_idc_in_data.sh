#!/system/bin/sh

# Create touch input idc file in /data/system/devices/idc/

# Author: Jon West <electrikjesus@gmail.com>

# if no arguments are given, then just show help
help() {
    echo "Usage: -t|--touchscreen|-p|--touchpad $0 <vendor ID> <product ID> <version ID>"  
    echo "Example: $0 -t 0d3a a000 0000"
    echo ""
    echo "To find the info, run the command: 'dumpsys input', and find your touchscreens vendor and product IDs."
    exit 1
}

# if no arguments are given, then just show help
if [ "$#" -eq 0 ]; then
    help
fi

# use case statement and shift for first arguments if found
while [ "$#" -gt 0 ]; do
    case "$1" in
        -t|--touchscreen)
            TOUCHSCREEN=true
            shift
            ;;
        -p|--touchpad)
            TOUCHPAD=true
            shift
            ;;
        *)
            break
            ;;
    esac
done

VENDOR="$1"
PRODUCT="$2"
VERSION="$3"

if [ -z "$VENDOR" ] || [ -z "$PRODUCT" ] || [ -z "$VERSION" ]; then
    help
fi

# Create the directory
mkdir -p /data/system/
mkdir -p /data/system/devices/
mkdir -p /data/system/devices/idc/

# Create the file and write the contents
if [ "$TOUCHSCREEN" = true ]; then
echo "#Input device config file
device.internal = 1
touch.deviceType = touchScreen

" > /data/system/devices/idc/Vendor_${VENDOR}_Product_${PRODUCT}_Version_${VERSION}.idc

elif [ "$TOUCHPAD" = true ]; then
echo "#Input device config file
touch.deviceType = default
touch.orientationAware = 1
touch.gestureMode = spots

" > /data/system/devices/idc/Vendor_${VENDOR}_Product_${PRODUCT}_Version_${VERSION}.idc

fi

chmod 644 /data/system/devices/idc/Vendor_${VENDOR}_Product_${PRODUCT}_Version_${VERSION}.idc

echo -e "idc file created in /data/system/devices/idc/Vendor_${VENDOR}_Product_${PRODUCT}_Version_${VERSION}.idc"
echo -e "Please reboot the device to apply the changes"