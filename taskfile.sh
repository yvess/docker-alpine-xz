#!/bin/bash

#####################################################################
# In order to run them easily, add the following alias to your shell:
# > echo "alias task='./taskfile.sh'" >> ~/.bash_aliases # or your profile file
#
# After that, you can run the tasks as follows:
# > task <function_name>
#####################################################################

# Enable shell strict mode
set -euo pipefail
VERSION="1.0"

# BUILD IMAGES
build-arch () {
    docker buildx build \
        --build-arg BUILDKIT_INLINE_CACHE=1 \
        --load \
        --platform linux/`arch|sed 's/x86_64/amd64/'` \
        -t yves/alpine-xz:$VERSION .
}

push-archs () {
    docker buildx build \
        --push \
        --build-arg BUILDKIT_INLINE_CACHE=1 \
        --platform linux/arm64 \
        -t yves/alpine-xz:$VERSION .
}


# execute passed string as function
"$@"