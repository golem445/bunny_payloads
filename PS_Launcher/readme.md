# PS_Launcher
* Author: golem445
* Version: 1.0

## Description

Sets up Ethernet and HID keyboard interfaces simultaneously,
then uses HID to execute the configured Powershell command
via local web server. Insert the Powershell payload to be
executed into your powershell_exec.txt file.

Note: This module will bypass network restrictions on USB
disk drives as only a network card and keyboard are emulated.

## Requirements

gohttp should be installed

## STATUS

| Status              | Description                              |
| ------------------- | ---------------------------------------- |
| Flashing Red        | gohttp not found                         |
| Solid Violet        | Setup for attack                         |
| Flashing Amber      | Attack in progress                       |
| Flashing Cyan       | Cleaning up                              |
| Solid Green         | Attack complete                          |
