export PATH=$PATH:/Applications/Android/sdk/tools:/Applications/Android/sdk/platform-tools:~/program/android_tools:~/program/android_tools/dex2jar:/Applications/android-sdk/ndk-bundle

export JAVA_HOME=`/usr/libexec/java_home -v "11"`

# for Kontribute
# JDKはzulu open jdkを利用
# https://www.azul.com/downloads/zulu-community/?os=macos&architecture=arm-64-bit&package=jdk
# 1.6/1.7はzipで解凍したディレクトリをダイレクトに移動してるのでパスをそのまま書いている
export JDK_16=/Library/Java/JavaVirtualMachines/zulu-6.jdk/zulu-16.jdk/Contents/Home
export JDK_17=/Library/Java/JavaVirtualMachines/zulu-7.jdk/zulu-17.jdk/Contents/Home
export JDK_18=`/usr/libexec/java_home -v "1.8"`
export JDK_9=`/usr/libexec/java_home -v "11"`
export ANT_OPTS="-Xmx2048m"
export MAVEN_OPTS="-Xmx2G"

export ANDROID_SDK_ROOT=/Applications/Android/sdk
export ANDROID_HOME=/Applications/Android/sdk
export NDK_ROOT=/Applications/Android/sdk/ndk-bundle

# for nodenv
eval "$(nodenv init -)"
