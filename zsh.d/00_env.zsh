PATH=$PATH:/Applications/Android/sdk/tools
PATH=$PATH:/Applications/Android/sdk/platform-tools
PATH=$PATH:~/program/android_tools/dex2jar
PATH=$PATH:/Applications/android-sdk/ndk-bundle
PATH=$PATH:"~/Library/Application Support/JetBrains/Toolbox/scripts"
PATH=$PATH:~/program/procon/atcoder_python
PATH=$PATH:~/program/flutter_sdk/flutter/bin
PATH=$PATH:/opt/homebrew/bin
PATH=$PATH:$HOME/.docker/bin
PATH=$PATH:$HOME/.rd/bin
PATH="$(mise where rust)/bin:$PATH"
export PATH=$PATH

# for Kontribute
# JDKはzulu open jdkを利用
# https://www.azul.com/downloads/zulu-community/?os=macos&architecture=arm-64-bit&package=jdk
# 1.6/1.7はzipで解凍したディレクトリをダイレクトに移動してるのでパスをそのまま書いている
export JDK_1_6=/Library/Java/JavaVirtualMachines/zulu-6.jdk/zulu-16.jdk/Contents/Home
export JDK_1_7=/Library/Java/JavaVirtualMachines/zulu-7.jdk/zulu-17.jdk/Contents/Home
export ANT_OPTS="-Xmx2048m"
export MAVEN_OPTS="-Xmx2G"

export ANDROID_SDK_ROOT=/Applications/Android/sdk
export ANDROID_HOME=/Applications/Android/sdk
export NDK_ROOT=/Applications/Android/sdk/ndk-bundle

export DOCKER_DEFAULT_PLATFORM=linux/amd64

# ollama
export OLLAMA_MODELS=/Volumes/WDSN7100_1/ai/ollama/models

# 1password
# export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock

export LANG=en_US.UTF-8
