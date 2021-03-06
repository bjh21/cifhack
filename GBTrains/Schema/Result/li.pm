use utf8;
package GBTrains::Schema::Result::li;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

GBTrains::Schema::Result::li

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<li>

=cut

__PACKAGE__->table("li");

=head1 ACCESSORS

=head2 lineno

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

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
  "lineno",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
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

=head1 PRIMARY KEY

=over 4

=item * L</lineno>

=back

=cut

__PACKAGE__->set_primary_key("lineno");


# Created by DBIx::Class::Schema::Loader v0.07039 @ 2014-09-14 13:05:17
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:6OIvpoVvgGzT4hSGbkDHmg

__PACKAGE__->add_columns(
    "lineno",
    { data_type => "integer", is_nullable => 0 });
__PACKAGE__->set_primary_key("lineno");
__PACKAGE__->belongs_to(cr => 'GBTrains::Schema::Result::cr', 'crlineno');
__PACKAGE__->belongs_to(ti => 'GBTrains::Schema::Result::ti', 'tiploc');
__PACKAGE__->inflate_column(activity => {
    inflate => sub {
	my ($raw, $result) = @_;
	return [grep($_ ne '', unpack('A2A2A2A2A2A2', $raw))];
    },
    deflate => sub {
	my ($cooked, $result) = @_;
	return pack("A2A2A2A2A2A2", @$cooked);
    }
			    });

# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
