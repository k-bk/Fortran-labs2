#!/bin/bash
touch result2

for i in 1 2 3 4 5
do
	for j in 128 256 512 1024 2048
	do
		make graphs SIZE=$j VER=$i
		echo "$j $i" >> result
		./graphs >> result
	done
done
