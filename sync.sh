
# git remote add upstream https://dawn.googlesource.com/dawn

git fetch upstream && \
git merge upstream/main

# Careful, this moves all submodules to HEAD of their remotes, but this is not always where they are at google.
#
# git submodule update --remote
