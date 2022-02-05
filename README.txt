COMMANDS

nano /usr/local/nagios/libexec/log_disk_load_average.sh
chmod +x /usr/local/nagios/libexec/log_disk_load_average.sh
touch /var/log/disk_load_avg.log

EDITOR=nano crontab -e

### disk load avg logging ###
* * * * * /usr/local/nagios/libexec/log_disk_load_average.sh

nano /usr/local/nagios/libexec/check_disk_load_average.sh