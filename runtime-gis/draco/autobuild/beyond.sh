# We don't need a static library, but draco will always create static lib target
# so remove it

BUILD_PATH=$(pwd)/abdist
DRACO_CMAKE=usr/share/cmake/draco/draco-targets-relwithdebinfo.cmake
abinfo "remove static target at "$BUILD_PATH/$DRACO_CMAKE
sed '/# Import target "draco::draco_static"/,/# Import target "draco::draco"/d' \
    $BUILD_PATH/$DRACO_CMAKE > $BUILD_PATH/$DRACO_CMAKE.new

# rename
rm -f $BUILD_PATH/$DRACO_CMAKE
mv $BUILD_PATH/$DRACO_CMAKE.new $BUILD_PATH/$DRACO_CMAKE

DRACO_CMAKE=usr/share/cmake/draco/draco-targets.cmake
abinfo "remove static target at "$BUILD_PATH/$DRACO_CMAKE
sed '/# Create imported target draco::draco_static/,/# Create imported target draco::draco/d' \
    $BUILD_PATH/$DRACO_CMAKE > $BUILD_PATH/$DRACO_CMAKE.new

# rename
rm -f $BUILD_PATH/$DRACO_CMAKE
mv $BUILD_PATH/$DRACO_CMAKE.new $BUILD_PATH/$DRACO_CMAKE

