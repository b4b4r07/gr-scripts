zmodload zsh/mathfunc
data=(${(@f)"$(<~/data/ika/2015/12/02/ika_101001.txt)"})

j=1
for (( i=1; i <= $#data; i++ ))
do
    let j++
    current_orient=${${(s:,:)data[i]}[11]}
    current_speed=${${(s:,:)data[i]}[10]}
    next_speed=${${(s:,:)data[j]}[10]}

    if (( current_orient > 90 && current_orient < 270 )); then
        if (( abs(current_speed - next_speed ) < 1.4 )); then
            : echo "$i: $current_speed"
            list+=($data[$i])
        else
            : echo "------------------------"
        fi
    else
        : echo "------------------------"
    fi
done

echo $#list
