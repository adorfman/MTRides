package MTRides::M::Privileges;

use strict;
use warnings;
use base qw(ADApps::DataObject);

__PACKAGE__->use_db('mtrides');

__PACKAGE__->meta->setup(

    table => 'privileges',
    columns => [ 
        id          => { primary_key => 1  },         
        name        => { type => 'varchar', length => 30  },     
        description => { type => 'text'},   

    ],
    relationships => [
        roles => {
            type => 'many to many',
            map_class => 'MTRides::M::RolesPrivileges',
            map_from  => 'privilege',
            map_to    => 'role'
        }  
        
    ],


);  

__PACKAGE__->load_manager_methods;

1;
