# IDC Scripts

## Step 1 - Collect the needed info from the device

Start out by using ADB or root terminall on the device and run the following command:
```
adb shell dumpsys input
```

The output will contain something like this:

```
27: IPTS 1B96:006A Touchscreen
    Classes: TOUCH
    Path: /dev/input/event11
    Enabled: true
    Descriptor: ff8061d4efa5e99a6ea1bcc5344b4d0c1ee5dda4
    Location:
    ControllerNumber: 0
    UniqueId:
    Identifier: bus=0x0000, vendor=0x1b96, product=0x006a, version=0x0000
    KeyLayoutFile:
    KeyCharacterMapFile:
    ConfigurationFile:
    VideoDevice: <none>
32: Microsoft Surface Type Cover Touchpad
    Classes: TOUCH | TOUCH_MT | EXTERNAL
    Path: /dev/input/event4
    Enabled: true
    Descriptor: 1f0ff612310fef5738317a21dbc1901a49fe20ec
    Location: usb-0000:00:14.0-7/input0
    ControllerNumber: 0
    UniqueId:
    Identifier: bus=0x0003, vendor=0x045e, product=0x07e8, version=0x0111
    KeyLayoutFile:
    KeyCharacterMapFile:
    ConfigurationFile:
    VideoDevice: <none>
```

We want the Identifier:
For Touchscreen:
```
Identifier: bus=0x0000, vendor=0x1b96, product=0x006a, version=0x0000
```
For Touchpad"
```
Identifier: bus=0x0003, vendor=0x045e, product=0x07e8, version=0x0111
```

So you would plug in the USB, and open up the alt-f1 console or push to the device use adb root shell.

For on-device, do the following (changing the ###-### to match what USB ID is there):
```
sh /mnt/media_rw/###-###/create_touch_input__idc_in_data.sh -t|--touchscreen|-p|--touchpad <vendor ID> <product ID> <version ID>

```
or:
```
sh /sdcard/Download/create_touch_input__idc_in_data.sh -t|--touchscreen|-p|--touchpad <vendor ID> <product ID> <version ID>

```
Example for touchscreen:
```
sh /mnt/media_rw/###-###/create_touch_input__idc_in_data.sh -t 1b96 006a 0000

```
(changing the ###-### to match what USB ID is there)