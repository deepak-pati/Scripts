#!/usr/bin/sh

change_password()
{
	echo "Enter User Name"
	read user_name
	sudo passwd $user_name
}

see_disk_space()
{
	echo "\n Showing Disk Space\n=====================\n"
	df -h
	echo "\n"
}

login_ssh()
{
	echo "\n Enter Remote box hostname/ipaddress:  \n"
	read rem_hostname
	echo "\n Enter username of remote box: \n"
	read rem_username 

	sudo ssh $rem_username@$rem_hostname
}

show_all_services_running()
{
	echo "\n All Services Running\n=======================\n"
	service --status-all | more
	echo "\n\n"
}

all_ports_opened()
{
	echo "\n ============= All Opened Ports =============== \n"
	netstat -nalp | more
	echo "\n ===============================================\n\n"
}

kill_application()
{
	echo "\n Enter running application name: \n"
	read app_name
	ps -ef | grep $app_name | awk '{print $2}' | xargs kill -9 
}

all_java_apps_running()
{
	echo "\n ==== All Java Processes ====\n ============================\n"
	ps -ef | grep java | grep -v grep
	echo "\n =============================\n"
}

while [ 1 ]
do
	echo "\t------------------------"
	echo "\tEnter enter a choice :"
	echo "\t------------------------"
	echo "\t\t1- Change Password"
	echo "\t\t2- See Disk Space"
	echo "\t\t3- Login To Other Box using SSH"
	echo "\t\t4- Show all services running"
	echo "\t\t5- Show all ports opened"
	echo "\t\t6- Show all java apps running"
	echo "\t\t7- Kill a application"
	echo "\t\t8: Exit"
	echo "\t------------------------"

	read user_option

	if [ $user_option  -eq 1 ]
	then
		change_password
	fi

	if [ $user_option  -eq 2 ]
	then
		see_disk_space
	fi

	if [ $user_option  -eq 3 ]
	then
		login_ssh
	fi

	if [ $user_option  -eq 4 ]
	then
		show_all_services_running
	fi

	if [ $user_option  -eq 5 ]
	then
		all_ports_opened
	fi

	if [ $user_option  -eq 6 ]
	then
		all_java_apps_running
	fi

	if [ $user_option  -eq 7 ]
	then
		kill_application
	fi

	if [ $user_option  -eq 8 ]
	then
		exit
	fi
done			
