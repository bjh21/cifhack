package My::Schema::Result::li;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

My::Schema::Result::li

=cut

__PACKAGE__->table("li");

=head1 ACCESSORS

=head2 crlineno

  data_type: 'integer'
  is_nullable: 1

=head2 tiploc

  data_type: (empty string)
  is_nullable: 1

=head2 suffix

  data_type: (empty string)
  is_nullable: 1

=head2 sched_arr_time

  data_type: (empty string)
  is_nullable: 1

=head2 sched_dep_time

  data_type: (empty string)
  is_nullable: 1

=head2 sched_pass

  data_type: (empty string)
  is_nullable: 1

=head2 public_arr_time

  data_type: (empty string)
  is_nullable: 1

=head2 public_dep_time

  data_type: (empty string)
  is_nullable: 1

=head2 platform

  data_type: (empty string)
  is_nullable: 1

=head2 line

  data_type: (empty string)
  is_nullable: 1

=head2 path

  data_type: (empty string)
  is_nullable: 1

=head2 activity

  data_type: (empty string)
  is_nullable: 1

=head2 eng_allow

  data_type: (empty string)
  is_nullable: 1

=head2 path_time

  data_type: (empty string)
  is_nullable: 1

=head2 perform_allow

  data_type: (empty string)
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "crlineno",
  { data_type => "integer", is_nullable => 1 },
  "tiploc",
  { data_type => "", is_nullable => 1 },
  "suffix",
  { data_type => "", is_nullable => 1 },
  "sched_arr_time",
  { data_type => "", is_nullable => 1 },
  "sched_dep_time",
  { data_type => "", is_nullable => 1 },
  "sched_pass",
  { data_type => "", is_nullable => 1 },
  "public_arr_time",
  { data_type => "", is_nullable => 1 },
  "public_dep_time",
  { data_type => "", is_nullable => 1 },
  "platform",
  { data_type => "", is_nullable => 1 },
  "line",
  { data_type => "", is_nullable => 1 },
  "path",
  { data_type => "", is_nullable => 1 },
  "activity",
  { data_type => "", is_nullable => 1 },
  "eng_allow",
  { data_type => "", is_nullable => 1 },
  "path_time",
  { data_type => "", is_nullable => 1 },
  "perform_allow",
  { data_type => "", is_nullable => 1 },
);


# Created by DBIx::Class::Schema::Loader v0.07010 @ 2011-12-08 16:27:11
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:AFZfkUd2a8CLAdO85+d9wg

__PACKAGE__->add_columns(
    "lineno",
    { data_type => "integer", is_nullable => 0 });
__PACKAGE__->set_primary_key("lineno");
__PACKAGE__->belongs_to(cr => 'My::Schema::Result::cr', 'crlineno');
__PACKAGE__->belongs_to(ti => 'My::Schema::Result::ti', 'tiploc');

# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
