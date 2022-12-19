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
    sudo semanage port -a -t ssh_port_t -p tcp 2222;
    sed -i 's/#Port 22/Port 2222/' /etc/ssh/sshd_config;
    firewall-cmd --zone=public --add-port=2222/tcp --permanent;
    firewall-cmd --reload;
    systemctl restart sshd;

}


disable_root_login(){
    sed -i 's/PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config;

}





add_user(){
    echo 'want to add user to sudoers yes/no ?';
    read sudo_or_not;
    useradd $1;
    if [ "$sudo_or_not" == 'yes' ]
        then usermod -aG wheel $1;
    fi    
}

add_cron (){
    echo "* 12 * * * tar -zcf /cron_backup.tgz $home" >  "/cron_backup,txt";
    sudo crontab "/cron_backup,txt";
}