#!/bin/bash
groupadd ncsadmin
groupadd ncsoper
usermod -a -G ncsadmin root
usermod -a -G ncsadmin tailf
chmod ug+rx $(find /var/opt/ncs /opt/ncs /var/log/ncs -type d)
chmod ug+r $(find /opt/ncs -type f)
chmod a+rx $(find /var/opt/ncs/scripts -type f)
chmod ug+rx $(find /opt/ncs/current/bin -type f)
chmod ug+rw $(find /var/opt/ncs -type f)
chmod ug+r $(find /var/log/ncs -type f)
chgrp -R ncsadmin /opt/ncs
chgrp -R ncsadmin /var/opt/ncs
chgrp -R ncsadmin /var/log/ncs
chgrp -R ncsadmin /opt/ncs/current/ncsrc
chgrp -R ncsadmin /opt/ncs/current/bin
chgrp -R ncsadmin /opt/ncs/downloads
echo 'source /opt/ncs/current/ncsrc' >> /etc/profile
