package MTRides::M::Cars;

#use lib $ENV{'ADAPPS_LIB'};
use strict;
use warnings;
use base qw(ADApps::DataObject); 

__PACKAGE__->use_db('mtrides');


__PACKAGE__->meta->setup(
    table   => 'cars',
    columns => [
        id             => { primary_key => 1 },
        make           => { type => 'varchar', length => 20  },
        model          => { type => 'varchar', length => 20  }, 
        year           => { type => 'int', length => 4  },
        license_plate  => { type => 'varchar', length => 20 },   
        owner_id       => { type => 'int', length => 8  }
    ],

    unique_key => ['make','model','year'],

    relationships => [
        person => {
            type =>  'many to one',
            class => 'MTRides::M::People',
            column_map => { owner_id => 'id' }
        },
        colors => {
            type      => 'many to many',
            map_class => 'MTRides::M::CarsColors', 
            map_from  => 'car',
            map_to    => 'color'
        },
        tags => {
            type    => 'many to many',
            map_class => 'MTRides::M::MapTags',
            map_from  => 'car',
            map_to    => 'tag',
            query_args => [ type => 'car' ]
        }

    ],

);


__PACKAGE__->load_manager_methods();


1;
