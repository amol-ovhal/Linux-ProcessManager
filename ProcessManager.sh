#!/bin/bash

ACTION=$1
source function.sh
source logfunction.sh 

case $ACTION in
        "TopProcess")
                TopProcess $2 $3
                ;;
        "KillLeastPriorityProcess")
                KillLeastPriorityProcess
                ;;
        "RunningDurationProcess")
                RunningDurationProcess $2
                ;;
        "RunningDurationName")
                RunningDurationName $2
                ;;
        "ListOrphanProcess")
                ListOrphanProcess
                ;;
        "ListZombieProcess")
                ListZombieProcess
                ;;
        "KillProcess")
                KillProcess $2
                ;;
        "ListWaitingProcess")
                ListWaitingProcess
                ;;
            *)
                errorMessage "Please Enter Valid Input"
                ;;

esac
