use utf8;
package GBTrains::Schema::Result::ti;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

GBTrains::Schema::Result::ti

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<ti>

=cut

__PACKAGE__->table("ti");

=head1 ACCESSORS

=head2 tiploc

  data_type: (empty string)
  is_nullable: 0

=head2 caps

  data_type: (empty string)
  is_nullable: 1

=head2 nalco

  data_type: (empty string)
  is_nullable: 1

=head2 nalco_check

  data_type: (empty string)
  is_nullable: 1

=head2 tps_descr

  data_type: (empty string)
  is_nullable: 1

=head2 stanox

  data_type: (empty string)
  is_nullable: 1

=head2 po_mcp

  data_type: (empty string)
  is_nullable: 1

=head2 crs_code

  data_type: (empty string)
  is_nullable: 1

=head2 capri_descr

  data_type: (empty string)
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "tiploc",
  { data_type => "", is_nullable => 0 },
  "caps",
  { data_type => "", is_nullable => 1 },
  "nalco",
  { data_type => "", is_nullable => 1 },
  "nalco_check",
  { data_type => "", is_nullable => 1 },
  "tps_descr",
  { data_type => "", is_nullable => 1 },
  "stanox",
  { data_type => "", is_nullable => 1 },
  "po_mcp",
  { data_type => "", is_nullable => 1 },
  "crs_code",
  { data_type => "", is_nullable => 1 },
  "capri_descr",
  { data_type => "", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</tiploc>

=back

=cut

__PACKAGE__->set_primary_key("tiploc");


# Created by DBIx::Class::Schema::Loader v0.07039 @ 2014-09-14 13:05:17
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:R1QbtADXXJKJLS2BQrLm8g

__PACKAGE__->has_many(lis => 'GBTrains::Schema::Result::li', 'tiploc');

# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
