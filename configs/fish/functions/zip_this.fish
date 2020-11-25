
function zip_this --description 'Save git directory to ZIP archive'
  set -l ZIPDIR $argv
  pushd $ZIPDIR
  git archive -o $ZIPDIR.zip HEAD
  mv $ZIPDIR.zip  ../
  popd $ZIPDIR
end