package GBTrains::Schema::Result::cr;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

GBTrains::Schema::Result::cr

=cut

__PACKAGE__->table("cr");

=head1 ACCESSORS

=head2 lineno

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 bslineno

  data_type: 'integer'
  is_nullable: 1

=head2 tiploc

  data_type: (empty string)
  is_nullable: 1

=head2 suffix

  data_type: (empty string)
  is_nullable: 1

=head2 category

  data_type: (empty string)
  is_nullable: 1

=head2 train_identity

  data_type: (empty string)
  is_nullable: 1

=head2 headcode

  data_type: (empty string)
  is_nullable: 1

=head2 course_ind

  data_type: (empty string)
  is_nullable: 1

=head2 service_code

  data_type: (empty string)
  is_nullable: 1

=head2 bussec

  data_type: (empty string)
  is_nullable: 1

=head2 power_type

  data_type: (empty string)
  is_nullable: 1

=head2 timing_load

  data_type: (empty string)
  is_nullable: 1

=head2 speed

  data_type: (empty string)
  is_nullable: 1

=head2 oper_chars

  data_type: (empty string)
  is_nullable: 1

=head2 class

  data_type: (empty string)
  is_nullable: 1

=head2 sleepers

  data_type: (empty string)
  is_nullable: 1

=head2 reservations

  data_type: (empty string)
  is_nullable: 1

=head2 connect_ind

  data_type: (empty string)
  is_nullable: 1

=head2 catering

  data_type: (empty string)
  is_nullable: 1

=head2 service_brand

  data_type: (empty string)
  is_nullable: 1

=head2 pref_tract

  data_type: (empty string)
  is_nullable: 1

=head2 uic_code

  data_type: (empty string)
  is_nullable: 1

=head2 rsid

  data_type: (empty string)
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "lineno",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "bslineno",
  { data_type => "integer", is_nullable => 1 },
  "tiploc",
  { data_type => "", is_nullable => 1 },
  "suffix",
  { data_type => "", is_nullable => 1 },
  "category",
  { data_type => "", is_nullable => 1 },
  "train_identity",
  { data_type => "", is_nullable => 1 },
  "headcode",
  { data_type => "", is_nullable => 1 },
  "course_ind",
  { data_type => "", is_nullable => 1 },
  "service_code",
  { data_type => "", is_nullable => 1 },
  "bussec",
  { data_type => "", is_nullable => 1 },
  "power_type",
  { data_type => "", is_nullable => 1 },
  "timing_load",
  { data_type => "", is_nullable => 1 },
  "speed",
  { data_type => "", is_nullable => 1 },
  "oper_chars",
  { data_type => "", is_nullable => 1 },
  "class",
  { data_type => "", is_nullable => 1 },
  "sleepers",
  { data_type => "", is_nullable => 1 },
  "reservations",
  { data_type => "", is_nullable => 1 },
  "connect_ind",
  { data_type => "", is_nullable => 1 },
  "catering",
  { data_type => "", is_nullable => 1 },
  "service_brand",
  { data_type => "", is_nullable => 1 },
  "pref_tract",
  { data_type => "", is_nullable => 1 },
  "uic_code",
  { data_type => "", is_nullable => 1 },
  "rsid",
  { data_type => "", is_nullable => 1 },
);
__PACKAGE__->set_primary_key("lineno");


# Created by DBIx::Class::Schema::Loader v0.07010 @ 2011-12-08 16:27:11
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Oo2FL8vQNqkoF16CN/+fsA

__PACKAGE__->belongs_to(bs => 'GBTrains::Schema::Result::bs', 'bslineno');
__PACKAGE__->has_many(lis => 'GBTrains::Schema::Result::li', 'crlineno',
    { order_by => 'lineno' });

# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
