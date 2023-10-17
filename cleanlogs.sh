#!/bin/bash
 log_path="/var/log/apache2"
sudo rm -rf /var/log/*proxy*.log
sudo rm -rf /var/log/*.gz
sudo chmod +x log-clean.sh

sudo crontab -e
0 0 * * 0 /bin/bash /root/projecttheo/log-clean.sh

#delete files older than 30 days
find $log_path* -mtime +30 -exec rm {} \;

echo "log files older than 30 days have been deleted from $log_path"
