#! /usr/bin/env   bash
echo 'sourcing working!'
user_is_has_root ()
{
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi
}


change_ssh_port(){
    echo 'please type sshd port';

    sudo semanage port -a -t ssh_port_t -p tcp $1;
    sed -i 's/#Port 22/Port $1/' /etc/ssh/sshd_config;
    firewall-cmd --zone=public --add-port=$1/tcp --permanent;
    firewall-cmd --reload;
    systemctl restart sshd;



}


disable_root_login(){
    sed -i 's/PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config;

}

add_group(){

    groupadd -g  20000 Audit;
}



add_user_with_pass(){
    pass=$(perl -e 'print crypt($ARGV[0], "password")' $3)

    useradd $2 -p $pass;
    usermod -aG Audit $2;  
    
}


create_reports(){
    start=2021-01-01
    end=2021-12-31
    while ! [[ $start > $end ]]; do
        if  [ !  -e  ~/reports/"$start.xls" ]
        then
            touch  ~/reports/"$start.xls"
        fi
        
        start=$(date -d "$start + 1 day" +%F)
    done

}


update_sys(){
        yum -y update
}

epell_installation(){
        sudo yum -y install epel-release
}


fail2ban_installation(){
     yum -y install "fail2ban"
	 systemctl enable "fail2ban" 
     systemctl start "fail2ban"	
}


backup_reports(){
    if [ -f  "report-$(date +%Y-%m-%d).tar" ]
    then
    echo "you have backup"
    else
    tar -cf report-$(date +%Y-%m-%d).tar
    fi

    if [ $hour -lt 5 ] || [ $hour -eq 12 ] && [ "$PM_OR_AM" == "AM" ]
    then
    mkdir /Backup
    mv report-$(date +%Y-%m-%d).tar /Backup
    echo "Backup finished"
    else
    echo "Backup Failed"
    fi
}

add_cron (){
    echo "* 12 * * * tar -zcf /cron_backup.tgz $home" >  "/cron_backup,txt";
    sudo crontab "/cron_backup,txt";
}


add_user_manager(){
    useradd -u 30000 manager;

}