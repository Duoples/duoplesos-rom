#!/bin/bash
set -e

echo "=========================================="
echo " Starting DuoplesOS Build on Crave.io"
echo "=========================================="

# 1. Configure Git identity
git config --global user.name "Duoples"
git config --global user.email "duoples77@gmail.com"

# 2. Initialize LineageOS 23.0 source tree
echo "[*] Initializing LineageOS 23.0 repo..."
repo init -u https://github.com/LineageOS/android.git -b lineage-23.0 --git-lfs

# 3. Setup Local Manifests for violet
echo "[*] Setting up local manifests..."
mkdir -p .repo/local_manifests
cat << 'EOF' > .repo/local_manifests/duoplesos.xml
<?xml version="1.0" encoding="UTF-8"?>
<manifest>
  <remote name="lineage" fetch="https://github.com/LineageOS" revision="lineage-23.0" />
  <remote name="muppets" fetch="https://github.com/TheMuppets" revision="lineage-23.0" />

  <project path="device/xiaomi/violet" name="android_device_xiaomi_violet" remote="lineage" />
  <project path="device/xiaomi/sm6150-common" name="android_device_xiaomi_sm6150-common" remote="lineage" />
  <project path="kernel/xiaomi/sm6150" name="android_kernel_xiaomi_sm6150" remote="lineage" />
  <project path="hardware/xiaomi" name="android_hardware_xiaomi" remote="lineage" />
  
  <project path="vendor/xiaomi/violet" name="proprietary_vendor_xiaomi_violet" remote="muppets" />
  <project path="vendor/xiaomi/sm6150-common" name="proprietary_vendor_xiaomi_sm6150-common" remote="muppets" />
</manifest>
EOF

# 4. Sync repositories
echo "[*] Syncing repositories..."
rm -rf prebuilts/clang/host/linux-x86
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags || (
    echo "[!] Initial sync failed on a repo, cleaning prebuilts and retrying..."
    rm -rf prebuilts/clang/host/linux-x86 .repo/projects/prebuilts/clang/host/linux-x86.git .repo/project-objects/platform/prebuilts/clang/host/linux-x86.git
    repo sync -c -j4 --force-sync --no-clone-bundle --no-tags
)

# 5. Apply DuoplesOS branding, apps, and device patches
echo "[*] Applying DuoplesOS customizations..."
rm -rf /tmp/duoplesos_custom
git clone "https://github.com/Duoples/duoplesos-rom.git" /tmp/duoplesos_custom

mkdir -p vendor/duoples
cp -r /tmp/duoplesos_custom/vendor/duoples/* vendor/duoples/

mkdir -p device/xiaomi/violet
cp -r /tmp/duoplesos_custom/device_violet_patches/* device/xiaomi/violet/

rm -rf /tmp/duoplesos_custom

# 6. Setup environment and build
echo "[*] Initializing build environment..."
source build/envsetup.sh

echo "[*] Selecting build target..."
breakfast duoples_violet || breakfast violet || lunch duoples_violet-ap3a-userdebug || lunch duoples_violet-trunk_staging-userdebug || lunch lineage_violet-ap3a-userdebug || lunch lineage_violet-userdebug || true

echo "[*] Starting build compilation (mka bacon)..."
mka bacon

echo "=========================================="
echo " DuoplesOS Build Completed Successfully!"
echo "=========================================="
