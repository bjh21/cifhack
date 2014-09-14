use utf8;
package GBTrains::Schema::Result::hd;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

GBTrains::Schema::Result::hd

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<hd>

=cut

__PACKAGE__->table("hd");

=head1 ACCESSORS

=head2 file_id

  data_type: (empty string)
  is_nullable: 1

=head2 extract_date

  data_type: (empty string)
  is_nullable: 1

=head2 extract_time

  data_type: (empty string)
  is_nullable: 1

=head2 current_file_ref

  data_type: (empty string)
  is_nullable: 1

=head2 last_file_ref

  data_type: (empty string)
  is_nullable: 1

=head2 update_ind

  data_type: (empty string)
  is_nullable: 1

=head2 version

  data_type: (empty string)
  is_nullable: 1

=head2 extract_start_date

  data_type: (empty string)
  is_nullable: 1

=head2 extract_end_date

  data_type: (empty string)
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "file_id",
  { data_type => "", is_nullable => 1 },
  "extract_date",
  { data_type => "", is_nullable => 1 },
  "extract_time",
  { data_type => "", is_nullable => 1 },
  "current_file_ref",
  { data_type => "", is_nullable => 1 },
  "last_file_ref",
  { data_type => "", is_nullable => 1 },
  "update_ind",
  { data_type => "", is_nullable => 1 },
  "version",
  { data_type => "", is_nullable => 1 },
  "extract_start_date",
  { data_type => "", is_nullable => 1 },
  "extract_end_date",
  { data_type => "", is_nullable => 1 },
);


# Created by DBIx::Class::Schema::Loader v0.07039 @ 2014-09-14 13:05:17
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:A/LWvstAzkc3BHyc+DkPPA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
