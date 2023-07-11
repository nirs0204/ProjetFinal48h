<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
| -------------------------------------------------------------------------
| Hooks
| -------------------------------------------------------------------------
| This file lets you define "hooks" to extend CI without hacking the core
| files.  Please see the user guide for info:
|
|	https://codeigniter.com/user_guide/general/hooks.html
|
*/
$hook['pre_system'] = function() {
    if (!extension_loaded('pdo_pgsql') || !extension_loaded('pgsql')) {
        show_error('PDO PostgreSQL and PostgreSQL extensions must be installed to use database.');
    }
};
