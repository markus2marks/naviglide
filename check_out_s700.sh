#/bin/sh
git clone .repo/projects/kernel.git
git clone .repo/projects/debian.git
git clone .repo/projects/u-boot.git

mkdir owl
mkdir -p owl/tools
mkdir toolchain
git clone .repo/projects/owl/s700.git ./owl/s700  
git clone .repo/projects/owl/scripts.git ./owl/scripts
git clone .repo/projects/owl/tools/adb_drv.git ./owl/tools/adb_drv
git clone .repo/projects/owl/tools/burn_tool.git ./owl/tools/burn_tool 
git clone .repo/projects/owl/tools/fw_maker.git ./owl/tools/fw_maker
git clone .repo/projects/owl/tools/utils.git ./owl/tools/utils
git clone .repo/projects/toolchain/aarch64-linux-gnu.git ./toolchain/aarch64-linux-gnu
git clone .repo/projects/toolchain/arm-linux-gnueabihf.git ./toolchain/arm-linux-gnueabihf
sync

#master branch
cp owl/scripts/build.sh ./autobuild.sh
cp owl/scripts/config.sh ./owl/
cp owl/scripts/root.mk ./owl/Makefile

sync

echo "please wait patiently"

#checkout cubie_dev
cd debian && git checkout cubie_dev && cd ..
cd kernel && git checkout cubie_dev && cd ..
cd u-boot && git checkout cubie_dev && cd ..
cd owl/s700 &&  git checkout cubie_dev && cd ../..
cd owl/scripts &&  git checkout cubie_dev && cd ../..
cd owl/tools/adb_drv  &&  git checkout cubie_dev && cd ../../..
cd owl/tools/burn_tool &&  git checkout cubie_dev && cd ../../.. 
cd owl/tools/fw_maker &&  git checkout cubie_dev && cd ../../.. 
cd owl/tools/utils &&  git checkout cubie_dev && cd ../../.. 
cd toolchain/aarch64-linux-gnu  &&  git checkout cubie_dev && cd ../..
cd toolchain/arm-linux-gnueabihf && git checkout cubie_dev && cd ../..

#sync cubie_dev
cp owl/scripts/build.sh ./autobuild.sh
cp owl/scripts/config.sh ./owl/
cp owl/scripts/root.mk ./owl/Makefile

sync
echo " "
echo " "
echo "check out successful!!!"
echo " "
echo " "

#repo forall -c git branch -d -r owl_s700/XXX
#repo forall -c git branch -D XXX
#repo forall -c git checkout cubie_dev
