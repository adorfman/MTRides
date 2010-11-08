package MTRides::M::Tags;

use strict;
use warnings;
use base qw(ADApps::DataObject);

__PACKAGE__->use_db('mtrides');

__PACKAGE__->meta->setup(
    table   => 'tags',
    columns => [
        id           => { primary_key => 1 },
        name         => { type => 'varchar', length => 15  },
    ],

    unique_key => ['id','name' ],
    
    relationships => [
        
        cars => {
            type       => 'many to many',
            map_class  => 'MTRides::M::MapTags', 
            map_from   => 'tag',
            map_to     => 'car',
            query_args => [ type => 'car'  ] 
        },

    ], 
);
1;
