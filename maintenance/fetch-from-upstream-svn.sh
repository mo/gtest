#!/bin/bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

REPO_ROOT="$SCRIPT_DIR/.."
UPSTREAM_SVN_URL="http://googletest.googlecode.com/svn/trunk/"
SVN_TEMP_DIR="$SCRIPT_DIR/gtest-svn"

USED_SUBDIRS="include src make"
for SUBDIR in $USED_SUBDIRS; do
	rm -rf $REPO_ROOT/$SUBDIR
done

svn checkout -q $UPSTREAM_SVN_URL $SVN_TEMP_DIR
for SUBDIR in $USED_SUBDIRS; do
	cp -r $SVN_TEMP_DIR/$SUBDIR $REPO_ROOT
done
REVISION="$(cd $SVN_TEMP_DIR && svn info | grep Revision: | cut -f 2 -d ' ')"
rm -rf $SVN_TEMP_DIR

echo "$REVISION" > $REPO_ROOT/REVISION

echo "Done fetching r$REVISION from gtest svn trunk."
