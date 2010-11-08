package MTRides::M::People::Roles;

use strict;
use warnings;
use base qw(ADApps::DataObject);

__PACKAGE__->use_db('mtrides');

__PACKAGE__->meta->setup(

    table => 'roles',
    columns => [ 
        id        => { type => 'int', length => 8,  primary_key => 1  },         
        name      => { type => 'varchar', length => 30  },     
        
    ],
    relationships => [
        people => {
            type       => 'one to many',
            class      => 'MTRides::M::People',
            column_map => { id => 'role_id' }
        },
        privileges => {
            type => 'many to many',
            map_class => 'MTRides::M::RolesPrivileges',
            map_from  => 'role',
            map_to    => 'privilege'

        }
    ]

);


__PACKAGE__->load_manager_methods;


1;
