package MTRides::M::CarsColors;
 
use strict;
use warnings;

use base qw(ADApps::DataObject); 

__PACKAGE__->use_db('mtrides');

__PACKAGE__->meta->setup(
    table   => 'cars_colors',
    columns =>  [
        id       => { type => 'int', primary_key => 1 },
        car_id   => { type => 'int', length => 8  },
        color_id => { type => 'int', length => 8  }, 
    ],
    unique_key => ['car_id','color_id'],


    relationships  => [
        car => {
            type  => 'many to one',
            class => 'MTRides::M::Cars',
            column_map => { car_id => 'id'}
        },
        color => {
            type   => 'many to one',
            class => 'MTRides::M::Colors',
            column_map => { color_id => 'id' }
        } 
    ],


);

__PACKAGE__->load_manager_methods();


1;
