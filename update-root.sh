#!/bin/bash

mv $1 $1/../moved
git clone https://github.com/claroline/Claroline.git
cd $1
git checkout 8.x
git checkout .
git config core.fileMode false

directories=('vendor' 'app/config' 'web' 'files' 'app/bootstrap.php.cache')
cd ..

for name in ${directories[@]}; do
    rm -rf Claroline/$name
    #cp -r moved/$name Claroline/$name
    mv moved/$name Claroline/$name
done
