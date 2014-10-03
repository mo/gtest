Partial git mirror of Google C++ Testing Framework

Upstream SVN: https://code.google.com/p/googletest/

For example the libgtest-dev package in Debian does not provide a pre-compiled
gtest .a file because upstream [recommends][1] that gtest is built with the
same compiler and macro defines as the code it is testing. This makes
libgtest-dev and other such distro packages quite inconvenient to use, so
instead of using that, this stripped down gtest git mirror can be added as a
git submodule and it can be built using recursive make whenever "make check"
is invoked.


[1]: https://groups.google.com/forum/#!topic/googletestframework/Zo7_HOv1MJ0
