#!/bin/bash

while true
do
	printf "\033c"
	echo -e "Author: Vershinina Sofia, group 717-1"
	echo -e "Program: Add repo"
	echo -e "About: A program for finding repositories and adding new ones\n\n"
	
	yum repolist all
	
	echo -en "\n\nEnter repo name: " 
	read name
	repo=$(yum repolist $name)
	echo $repo
	if [[ $repo == *"repo"* ]]; then
		command yum repolist $name
		echo -en "\n\nContinue? (y/n)"
		read user
		if [ "$user" == "Y" -o "$user" == "y" ]; then 
			printf "\033c"
		else
			printf "\033c"
			exit
		fi 	
	else 
		echo -en "Repo not found. Add repo? (y/n)"
		read user
		if [ "$user" == "Y" -o "$user" == "y" ]; then 
			while true 
			do
				echo -en "Enter repo id: "
				read repoID
				echo -en "Enter repo name: "
				read repoName
				echo -en "Enter baseurl: "
				read repoURL
				echo -en "Enabled (1/0)? "
				read repoEnabled
				echo -en "Gpgcheck (1/0)? "
				read repoCheck
				echo -en "Enter gpgkey:  "
				read repoKey
				
				echo -e "\n[$repoID]\nname=$repoName\nbaseurl=$repoURL\nenabled=$repoEnabled\ngpgcheck=$repoCheck\ngpgkey=$repoKey"
				
				echo -en "\nSave? (y/n)"
				read user
				if [ "$user" == "Y" -o "$user" == "y" ]; then 
					echo -en "Enter filename: "
					read filename
					command echo -e "[$repoID]\nname=$repoName\nbaseurl=$repoURL\nenabled=$repoEnabled\ngpgcheck=$repoCheck\ngpgkey=$repoKey" > "/etc/yum.repos.d/$filename.repo"
					break
				else 
					break
				fi
			done			
		else
			printf "\033c"
			exit
		fi 
	fi 	
done