#/etc/puppet/modules/nul_mysql_export/manifests/params.pp

class nul_mysql_export::params {

  $mysql_tables             = 'mysql'
  $mysql_root               = 'password'
  $mysql_days_before_delete = '30'
  $mysql_minute             = '05'
  $mysql_hour               = '2'
  $mysql_date               = '*'
  $mysql_month              = '*'
  $mysql_weekday            = '*'

}

