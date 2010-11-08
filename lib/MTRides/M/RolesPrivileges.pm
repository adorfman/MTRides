package ADApps::MTRides::RolesPrivileges;

use strict;
use warnings;
use base qw(ADApps::DataObject);

__PACKAGE__->use_db('mtrides');

__PACKAGE__->meta->setup(
   
    table   => 'roles_privileges',
    columns =>  [
        id       => { type => 'int', primary_key => 1 },
        role_id   => { type => 'int', length => 8  },
        privilege_id => { type => 'int', length => 8  }, 
    ],
    unique_key => ['role_id','privilege_id'],


    relationships  => [
        role => {
            type  => 'many to one',
            class => 'ADApps::MTRides::People::Roles',
            column_map => { role_id => 'id'}
        },
        privilege => {
            type   => 'many to one',
            class => 'ADApps::MTRides::Privileges',
            column_map => { privilege_id => 'id' }
        } 
    ],
      

);

1;
