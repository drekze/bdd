<?php
/*
PHP REST SQL: A HTTP REST interface to relational databases
written in PHP

postgresql.php :: PostgreSQL database adapter
Copyright (C) 2008 Guido De Rosa <guidoderosa@gmail.com>

based on MySQL driver mysql.php by Paul James
Copyright (C) 2004 Paul James <paul@peej.co.uk>

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
*/

/* $id$ */

/**
 * PHP REST PostgreSQL class
 * PostgreSQL connection class.
 */
class dbClass {
    var $db;

    /**
     * Connect to the database.
     * @param str[] config
     */
    function connect($config) {

		$connString = sprintf(
			'host=%s port=%s dbname=%s user=%s password=%s',
			$config['server'],
      $config['port'],
			$config['database'],
			$config['username'],
			$config['password']
		);

        if ($this->db = pg_pconnect($connString)) {
            return TRUE;
	    }
		return FALSE;
    }

    function close() {
        pg_close($this->db);
    }

    function query($sql) {
		return pg_query($this->db,$sql);
    }
}
?>
