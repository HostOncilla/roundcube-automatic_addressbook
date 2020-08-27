<?php

/**
 *
 * Automatic Addressbook Backend 
 *
 **/

class automatic_addressbook_backend extends rcube_contacts
{
    function __construct($dbconn, $user)
    {
        parent::__construct($dbconn, $user);
        $rcmail = rcmail::get_instance();
        $db_table = $rcmail->config->get('db_table_collected_contacts');
        $this->db_name = $rcmail->db->table_name($db_table);
    }
}
