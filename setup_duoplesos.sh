#!/bin/bash

# Duoplesos Setup Script
# This script helps rebrand a LineageOS source tree to Duoplesos.

# Paths (adjust if running from outside the root)
ROOT_DIR=$(pwd)
VENDOR_DIR="$ROOT_DIR/vendor/duoples"

echo "------------------------------------------------"
echo "   Duoplesos ROM Rebranding Tool"
echo "------------------------------------------------"

# 1. Check if we are in an Android source tree
if [ ! -d "$ROOT_DIR/.repo" ]; then
    echo "Error: .repo directory not found. Please run this from the root of your Android source tree."
    # exit 1 
fi

# 2. Rename strings in files (Case sensitive)
echo "[*] Renaming LineageOS to Duoplesos in source code..."
# Note: We use -r for recursive and -l to list files.
# We then use sed to replace the strings.
# This is a broad stroke and should be used with caution!

# Uncomment the following lines when running on a real synced tree
# grep -rl "LineageOS" . --exclude-dir=.git | xargs sed -i 's/LineageOS/Duoplesos/g'
# grep -rl "lineage" . --exclude-dir=.git | xargs sed -i 's/lineage/duoples/g'

# 3. Setup vendor directory
if [ -d "$VENDOR_DIR" ]; then
    echo "[*] Vendor directory already exists."
else
    echo "[*] Please copy the prepared vendor/duoples directory to your source tree."
fi

echo "Done! You can now try building with:"
echo "source build/envsetup.sh"
echo "lunch duoples_<device>-userdebug"
echo "mka bacon"
