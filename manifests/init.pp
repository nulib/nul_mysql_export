# /etc/puppet/modules/nul_mysql_export/manifests/init.pp

###
# nul_mysql_export
# ----------------
# This class installs a MySQL backup script onto the machine, this script can be set to run
# at a regular interval in order to export the database as a local backup.
# Several configuration variables are required, including:
#     - $mysql_tables - a list of MySQL tables to be exported
#     - $mysql_root - the MySQL root password so the script can run
#     - $mysql_days_before_delete - the number of days of backup files to keep on the local server
#     - $mysql_minute - minute that the cronjob should run (default 05)
#     - $mysql_hour - the hour that the cronjob should run (default 2)
#     - $mysql_date - the date (day of the month) that the cronjob should run (default *)
#     - $mysql_month - the month that the cronjob should run (default *)
#     - $mysql_weekday  - the day of the week that the cronjob should run (default *)
###


class nul_mysql_export (
 
  $mysql_tables             = $nul_mysql_export::params::mysql_tables,
  $mysql_root               = $nul_mysql_export::params::mysql_root,
  $mysql_days_before_delete = $nul_mysql_export::params::mysql_days_before_delete,
  $mysql_minute             = $nul_mysql_export::params::mysql_minute,
  $mysql_hour               = $nul_mysql_export::params::mysql_hour,
  $mysql_date               = $nul_mysql_export::params::mysql_date,
  $mysql_month              = $nul_mysql_export::params::mysql_date,
  $mysql_weekday            = $nul_mysql_export::params::mysql_weekday,
  ) inherits nul_mysql_export::params {

  include nul_mysql_export::config
  include nul_mysql_export::cron
}

