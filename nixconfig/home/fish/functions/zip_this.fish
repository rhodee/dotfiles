function zip_this --description 'Persistently prepends paths to your PATH'
    set -l ZIPDIR $argv
    pushd $ZIPDIR
    git archive -o $ZIPDIR.zip HEAD
    mv $ZIPDIR.zip  ../
    popd $ZIPDIR
end