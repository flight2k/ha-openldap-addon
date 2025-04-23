<?php
$servers = [];
$servers[] = [
  'name' => 'Home Assistant LDAP',
  'host' => '127.0.0.1',
  'port' => 389,
  'base' => [],
  'auth_type' => 'session',
  'bind_id' => 'cn=admin,dc=example,dc=org',
];
$config = [
  'login_attribute' => 'uid',
  'login_dn' => true,
  'hide_template_warning' => true,
];
