.PHONY: all

all: ios tvos maccatalyst

ios: ./ios/libchipmunk.framework/libchipmunk
./ios/libchipmunk.framework/libchipmunk:
	xcodebuild DISABLE_MANUAL_TARGET_ORDER_BUILD_WARNING=1 -project chipmunk.ios.xcodeproj -configuration Release -sdk iphonesimulator
	xcodebuild DISABLE_MANUAL_TARGET_ORDER_BUILD_WARNING=1 -project chipmunk.ios.xcodeproj  -configuration Release -sdk iphoneos
	ditto ./Build/Release-iphoneos/ ./ios/
	rm ./ios/libchipmunk.framework/libchipmunk
	lipo -create ./build/Release-iphonesimulator/libchipmunk.framework/libchipmunk  ./build/Release-iphoneos/libchipmunk.framework/libchipmunk -output  ./ios/libchipmunk.framework/libchipmunk

tvos: ./tvos/libchipmunk.framework/libchipmunk
./tvos/libchipmunk.framework/libchipmunk:
	xcodebuild DISABLE_MANUAL_TARGET_ORDER_BUILD_WARNING=1 -project chipmunk.tvos.xcodeproj -configuration Release -sdk appletvsimulator
	# Xcode 12 has a bug where it adds arm64 to appletv simulator
	./fix_tvos.sh
	xcodebuild DISABLE_MANUAL_TARGET_ORDER_BUILD_WARNING=1 -project chipmunk.tvos.xcodeproj  -configuration Release -sdk appletvos
	ditto ./Build/Release-appletvos/ ./tvos/
	rm ./tvos/libchipmunk.framework/libchipmunk
	lipo -create ./build/Release-appletvsimulator/libchipmunk.framework/libchipmunk  ./build/Release-appletvos/libchipmunk.framework/libchipmunk -output  ./tvos/libchipmunk.framework/libchipmunk

maccatalyst:  ./maccatalyst/libchipmunk.framework/libchipmunk
./maccatalyst/libchipmunk.framework/libchipmunk:
	xcodebuild -configuration Release -destination "platform=macOS,variant=Mac Catalyst" -project chipmunk.maccatalyst.xcodeproj -scheme libchipmunk SYMROOT=build_maccatalyst/
	ditto ./build_maccatalyst/Release-maccatalyst/libchipmunk.framework/Versions/A/ ./maccatalyst/libchipmunk.framework/

clean:
	rm -Rf build
	rm -Rf ./ios/
	rm -Rf ./maccatalyst/
	rm -Rf ./tvos/