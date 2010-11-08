package MTRides::M::People;

use strict;
use warnings;
use base qw(ADApps::DataObject); 

__PACKAGE__->use_db('mtrides');


__PACKAGE__->meta->setup(

    table => 'people',
    columns => [ 
        id          => { primary_key => 1  },         
        f_name      => { type => 'varchar', length => 30  },     
        l_name      => { type => 'varchar', length => 30  },          
        password    => { type => 'varchar', length => 30  },      
        email       => { type => 'varchar', length => 30  },        
        phone_num_1 => { type => 'int', length => 10  }, 
        phone_num_2 => { type => 'int', length => 10  },  
        position_id => { type => 'int', length => 8  },         
        picture_id  => { type => 'int', length => 8  },  
        role_id     => { type => 'int', length => 8  },   

    ],
    relationships => [
        cars => {
            type   => 'one to many',
            class  => 'MTRides::M::Cars',
            column_map => { id => 'owner_id' },
        },
        role => {
            type => 'many to one',
            class => 'MTRides::M::People::Roles',
            column_map => { role_id => 'id' },
            required   => 1
        }  
        
    ],


);

__PACKAGE__->load_manager_methods();

1;
