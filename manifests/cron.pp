#/etc/puppet/modules/nul_mysql_export/manifests/cron.pp

####
# nul_mysql_export::cron
# ----------------------
# This uses the torrancew-cron module to set up and configure cron for the MySQL backup script
####

class nul_mysql_export::cron {

  cron::job {
   'mysql_backup':
     minute      => $::nul_mysql_export::mysql_minute,
     hour        => $::nul_mysql_export::mysql_hour,
     date        => $::nul_mysql_export::mysql_date,
     month       => $::nul_mysql_export::mysql_month,
     weekday     => $::nul_mysql_export::mysql_weekday,
     user        => 'root',
     command     => '/usr/local/admin/bin/mysql_backup.pl',
     environment => [ 'MAILTO=root', 'PATH="/usr/bin:/bin"' ];
  }
}
