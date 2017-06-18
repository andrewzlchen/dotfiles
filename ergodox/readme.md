# Ergodox config

First you need to download dfu-utils, which is the bootloader software that throws the configuration files to the keyboard.

It is available in the AUR and I'm pretty sure that it's in the package manager by default in debian linux distros.

Download your desired keybindings and then unzip it. It should contain a json file and 2 important files that have either right or left within their names.

Be sure to make each side of the ergodox flashable by itself because it's easier to flash each side by itself.

run

```
dfu-util -l
```

this shows all of the devices currently connected

```
dfu-util -D <right/left keybindings file>
```

once this command is run with the corresponding keyboard, the keyboard should go from the flashing mode to normal, and should have the updated keybindings. Repeat for the other side and voila! 
