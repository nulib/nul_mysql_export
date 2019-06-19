# /etc/puppet/modules/nul_mysql_export/manifests/config.pp

class nul_mysql_export::config {
    $prepdirs = [ "/usr/local/admin/", "/usr/local/admin/bin",
                  "/usr/local/admin/mysql-conf", "/var/mysqlbackup",
                ]
      
    file { $prepdirs:
      ensure  => directory,
      owner   => 0,
      group   => 0,
      mode    => '0750',
    }
   
   # MySQL root password so the export script has it 
    file { '/usr/local/admin/mysql-conf/mysqlpass':
      ensure  => present,
      content => template('nul_mysql_export/mysqlpass.erb'),
      owner   => '0',
      group   => '0',
      mode    => '0600',
    }
     
   # List of MySQL tables that should be exported 
    file { '/usr/local/admin/mysql-conf/mysqltab':
      ensure  => present,
      content => template('nul_mysql_export/mysqltab.erb'),
      owner   => '0',
      group   => '0',
      mode    => '0600',
    }

    file { '/usr/local/admin/bin/mysql_backup.pl':
      ensure  => present,
      content => template('nul_mysql_export/mysql_backup.erb'),
      owner   => '0',
      group   => '0',
      mode    => '0755',
    }

}
