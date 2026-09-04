# How to Build Duoplesos (LineageOS 23 / Android 16)

This guide walks you through the steps to build your custom ROM, Duoplesos, on a machine with sufficient storage (300GB+).

## 1. Prerequisites
Ensure you are running a 64-bit Linux environment (Ubuntu 22.04+ recommended).

**Note for Ubuntu 24.04 (Noble) and ARM64 users:**
Some legacy 32-bit and multilib packages are not available or needed on ARM64. Use the following command:

```bash
sudo apt update
sudo apt install bc bison build-essential ccache curl flex git git-lfs gnupg gperf imagemagick libelf-dev liblz4-tool libncurses-dev libsdl1.2-dev libssl-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc zip zlib1g-dev
```

## 2. Set up Repo Tool
If you don't have the `repo` tool, install it:

```bash
mkdir -p ~/bin
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo
export PATH=~/bin:$PATH
```

## 3. Initialize Source
Create a directory for the source and initialize the LineageOS 23.0 (Android 16) branch.

```bash
mkdir ~/duoplesos-build
cd ~/duoplesos-build
repo init -u https://github.com/LineageOS/android.git -b lineage-23.0 --git-lfs
```

## 4. Add Duoplesos Branding
1. Copy the `vendor/duoples` directory from this environment to your build server's `vendor/duoples`.
2. Copy `duoplesos_manifest.xml` to `.repo/local_manifests/duoplesos.xml`.

```bash
mkdir -p .repo/local_manifests
# Copy the manifest file here
```

## 5. Sync the Source
This will download ~250GB-300GB of data.

```bash
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
```

## 6. Build Duoplesos
Initialize the build environment and start the build for your device.

6. Add the device patches:
   ```bash
   cp -r /path/to/your/repo/device_violet_patches/* ~/duoplesos-build/device/xiaomi/violet/
   ```

7. Run the build:
   ```bash
   source build/envsetup.sh
   lunch duoples_violet-userdebug
   mka bacon
   ```

## 7. Troubleshooting
- **Storage:** If you run out of space, the sync or build will fail.
- **Memory:** Android 16 requires at least 32GB of RAM (or swap) to build efficiently.
- **Java:** Ensure you are using the correct OpenJDK version (usually provided by the AOSP source tree).
