package MTRides::M::MapTags;

use strict;
use warnings;
use base qw(ADApps::DataObject);

__PACKAGE__->use_db('mtrides');
                               
__PACKAGE__->meta->setup(
    
    table   => 'map_tags',
    columns =>  [
        id         => { type => 'int', primary_key => 1 },
        other_id   => { type => 'int', length => 8  },
        tag_id     => { type => 'int', length => 8  }, 
        type       => { type => 'varchar', length => 10   }
    ],
    unique_key => ['id','other_id','type','tag_id'],


    relationships  => [
        tag => {
            type  => 'many to one',
            class => 'MTRides::M::Tags',
            column_map => { tag_id => 'id'}
        },
        car => {
            type        => 'many to one',
            class       => 'MTRides::M::Cars',
            column_map  => { other_id => 'id' },
            #key_columns => { type => 'car' }  
        } 
    ],


);
 
1;
