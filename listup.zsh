#!/bin/zsh

cd $HOME
for i in ./data/ika/2015/12/**/*.txt
do
    if [[ $i =~ ika_1200 && -s $i ]]; then
        data="$(cat $i | grep ",05,")"
        if [[ -n $data ]]; then
            echo -e "\033[32m$i\033[m"
            echo "$data" | awk 'NR==1{print} END{print}'
        fi
    fi
done
