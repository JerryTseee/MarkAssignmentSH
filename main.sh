#!/bin/bash
allStudent="2012111111 2012222222 2012333333"
for student in $allStudent
do
    if [ -d $student ]
    then
        cd $student
        if [ -e assign.cpp ]
        then
            g++ assign.cpp -o assign.o 2>error.txt# if there is error to open the file, then get the error signal
            if [ -e assign.o ]
            then
                ./assign.o < ../input.txt > output.txt
                result=`diff output.txt ../correct.txt`# use diff to check is there any different that student's homework is different from the standard answer.
                if [ ${#result} -ne "0" ]
                then
                    echo "$student: Wrong answer."
                else
                    echo "$student: Correct!"
                fi
            else
                echo "$student: Cannot be compiled."
            fi
        fi
        cd ..
    fi
done
