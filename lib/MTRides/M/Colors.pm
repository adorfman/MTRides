package MTRides::M::Colors;

use strict;
use warnings;
use base qw(ADApps::DataObject); 

__PACKAGE__->use_db('mtrides');


__PACKAGE__->meta->setup(
    table   => 'colors',
    columns => [
        id   => { primary_key => 1  },
        name => { type => 'varchar', length => 20  }

    ],

    unique_key => 'name',

    relationships => [
        'cars' =>  {
            type      => 'many to many',
            map_class => 'MTRides::M::CarsColors',
            map_from  => 'color',
            map_to    => 'car'
        },

    ],


);

__PACKAGE__->load_manager_methods(); 


1;
