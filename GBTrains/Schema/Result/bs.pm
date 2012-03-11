package GBTrains::Schema::Result::bs;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

GBTrains::Schema::Result::bs

=cut

__PACKAGE__->table("bs");

=head1 ACCESSORS

=head2 lineno

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 unique_id

  data_type: (empty string)
  is_nullable: 1

=head2 date_runs_from

  data_type: (empty string)
  is_nullable: 1

=head2 date_runs_to

  data_type: (empty string)
  is_nullable: 1

=head2 days

  data_type: (empty string)
  is_nullable: 1

=head2 bhx

  data_type: (empty string)
  is_nullable: 1

=head2 status

  data_type: (empty string)
  is_nullable: 1

=head2 stp

  data_type: (empty string)
  is_nullable: 1

=head2 atoc_code

  data_type: (empty string)
  is_nullable: 1

=head2 ats_code

  data_type: (empty string)
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "lineno",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "unique_id",
  { data_type => "", is_nullable => 1 },
  "date_runs_from",
  { data_type => "", is_nullable => 1 },
  "date_runs_to",
  { data_type => "", is_nullable => 1 },
  "days",
  { data_type => "", is_nullable => 1 },
  "bhx",
  { data_type => "", is_nullable => 1 },
  "status",
  { data_type => "", is_nullable => 1 },
  "stp",
  { data_type => "", is_nullable => 1 },
  "atoc_code",
  { data_type => "", is_nullable => 1 },
  "ats_code",
  { data_type => "", is_nullable => 1 },
);
__PACKAGE__->set_primary_key("lineno");


# Created by DBIx::Class::Schema::Loader v0.07010 @ 2011-12-08 16:27:11
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:o881skqG06tkiZR3cwOZxg

use DateTime::Format::ISO8601;
use GBTrains::Run;

__PACKAGE__->has_many(crs => 'GBTrains::Schema::Result::cr', 'bslineno',
    {order_by => 'lineno'});

sub lis {
    my $self = shift;
    # This mess is necessary because without it we just get "ORDER BY
    # lineno", which is ambiguous.
    my $rs = $self->crs->search_related('lis');
    my $me = $rs->current_source_alias;
    return $rs->search(undef, {order_by => "$me.lineno"})->search(@_);
}

sub lis_rs {
    my $self = shift;
    return scalar($self->lis(@_));
}

sub _parsedate {
    return DateTime::Format::ISO8601->parse_datetime($_[0], 'YYMMDD');
}

__PACKAGE__->inflate_column('date_runs_from',
			    { inflate => \&_parsedate });
__PACKAGE__->inflate_column('date_runs_to',
			    { inflate => \&_parsedate });

# Does this BS record apply to a particular date?
sub applies_to {
    my $self = shift;
    my ($date) = @_;
    my $ymd = substr($date->ymd(''), 2);
    return ($ymd >= $self->get_column('date_runs_from') &&
	    $ymd <= $self->get_column('date_runs_to') &&
	    substr($self->days, $date->day_of_week_0, 1) eq '1');
}

# Does this BS record describe a train that runs on a particular date?
sub runs_on {
    my $self = shift;
    my ($date) = @_;
    my $stp = $self->stp;
    if ($stp eq 'C') {
	# Cancellations never describe running trains.
	return 0;
    }
    return 0 unless $self->applies_to($date);
    if ($stp eq 'O' || $stp eq 'N') {
	# This is an overlay or a new service, so can't be cancelled
	# or overlaid.
	return 1;
    }
    if ($stp eq 'P') {
	# Permanent service.  Is it overlaid or cancelled?
	my @overlay = $self->result_source->resultset->search
	    ({unique_id => $self->unique_id, stp => ['C', 'O']});
	return !grep $_->applies_to($date), @overlay;
    }
    die "Unexpected STP field '$stp' in line $self->lineno";
}

sub instantiate {
    return GBTrains::Run->new(@_);
}

sub lo {
    my $self = shift;
    return $self->crs->first->lis->first;
}

sub lt {
    my $self = shift;
    return $self->crs({}, {order_by => 'lineno desc'})->first->
	lis({}, {order_by => '_rowid_ desc'})->first;
}

# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
