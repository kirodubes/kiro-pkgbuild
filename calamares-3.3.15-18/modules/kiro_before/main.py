#!/usr/bin/env python3

import subprocess
import shutil
import os
import libcalamares

def run():
    libcalamares.utils.debug("#################################")
    libcalamares.utils.debug("Start arcolinux-before")
    libcalamares.utils.debug("#################################\n")

    libcalamares.utils.debug("#################################")
    libcalamares.utils.debug("Populate Core Team keys")
    libcalamares.utils.debug("#################################\n")

    try:
        subprocess.run(["pacman-key", "--init"], check=True)
        subprocess.run(["pacman-key", "--populate", "archlinux"], check=True)
        subprocess.run(["pacman-key", "--populate", "chaotic"], check=True)
    except subprocess.CalledProcessError as e:
        return ("pacman-key-failed", f"Command failed: {e}")

    libcalamares.utils.debug("\n#################################")
    libcalamares.utils.debug("Changing into our own linux.preset")
    libcalamares.utils.debug("#################################\n")

    try:
        shutil.move("/etc/mkinitcpio.d/arcolinux", "/etc/mkinitcpio.d/linux.preset")
    except FileNotFoundError:
        return ("preset-not-found", "Could not find /etc/mkinitcpio.d/arcolinux.")
    except Exception as e:
        return ("preset-rename-failed", f"Failed to rename preset: {e}")

    libcalamares.utils.debug("\n#################################")
    libcalamares.utils.debug("End arcolinux-before")
    libcalamares.utils.debug("#################################\n")

    return None  # Indicates success
