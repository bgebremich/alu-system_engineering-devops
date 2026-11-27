# Raises the open file limit of Nginx so it can handle more concurrent requests
exec { 'fix--for-nginx':
  command => 'sed -i s/15/4096/ /etc/default/nginx',
  path    => ['/usr/local/bin', '/bin', '/usr/bin'],
}

exec { 'restart-nginx':
  command => 'service nginx restart',
  path    => ['/usr/sbin', '/usr/bin', '/sbin', '/bin'],
  require => Exec['fix--for-nginx'],
}
