function TopProcess () {

        NUM=`expr $1 + 7`
        if [ $2 == "memory" ]; then
                top -b -o +%MEM | head -n $NUM
        elif [ $2 == "cpu" ]; then
                top | head -n $NUM
        else
                errorMessage "Wrong choice"
        fi
}

function KillLeastPriorityProcess () {
        PID=`ps -e -o pri,pid | sort -g | awk 'NR==2{print $2}'`
        infoMessage "PID of Least Priority Process: $PID"
        kill $PID
}


function RunningDurationProcess () {
        PID=$1
        ps -p $PID -o etimes
        infoMessage "Running duration of a process by PID"
}

function RunningDurationName () {
        PROC=$1
        PID=pidof $PROC
        ps -p $PID -o etimes
        infoMessage "Running duration of a process by Name"
}

function ListOrphanProcess () {
        ps -elf | head -1; ps -elf | awk '{if ($5 == 1 && $3 != "root") {print $0}}' | head
        infoMessage "Listing Orphan Process"
}


function ListZombieProcess () {
        top -b1 -n1 | grep Z
        infoMessage "Listing Zombie Process"
}


function KillProcess () {
        PID=$1
        kill $PID
        infoMessage "Killed Process using PID $PID"
}

function ListWaitingProcess () {
        top -in 1
        infoMessage "Listing Idle/Waiting Process"
}

