package GBTrains::Run;

use warnings;
use strict;

=head1 NAME

 GBTrains::Run - a single run of a service

=head1 DESCRIPTION

 A C<GBTrains::Run> represents an individual run of a service, i.e. the
 fact (or expectation) of a train taking a particular route at a
 particular time on a particular day.  It is constructed by instantiating
 a C<GBTrains::Schema::bs> object with the required date.

=cut

use Carp;
use Class::Field qw/field/;

# Convert common null times from TSDB into proper undef.
sub nullify {
    no warnings 'uninitialized';
    my $x = @_ ? shift : $_;
    return ($x eq '0000' || $x eq '') ? undef : $x;
}

field 'bs';
field 'date';

sub new {
    my $class = shift;
    my $self = bless { }, $class;
    $self->bs(shift);
    $self->date(shift);
    # If the schedule doesn't run on this date, skip it.
    $self->bs->runs_on($self->date) or return undef;
    # We assume that the working and public timetables each go
    # monotonically forward in time.

    #
    # It's not clear what happens if the working and scheduled times start
    # on different days or in different timezones.
    my $sched_base = $self->date->clone;
    my $public_base = $self->date->clone;
    resolve_start($sched_base, $self->bs->lo->sched_dep_time);
    resolve_start($public_base, $self->bs->lo->public_dep_time);
    for my $li ($self->bs->lis) {
	my $stop = bless { li => $li }, 'GBTrains::Location';
	for my $f (qw(sched_arr_time sched_pass sched_dep_time)) {
	    $stop->{$f} = resolve_cont($sched_base, $li->get_column($f));
	}
	for my $f (qw(public_arr_time public_dep_time)) {
	    $stop->{$f} = resolve_cont($public_base, $li->get_column($f));
	}
	push @{$self->{stops}}, $stop;
    }
    return $self;
}

# Convert TSDB times into DateTimes.
# For the start of a service, the first argument is a DateTime representing
# the date on which the service starts.  It will be updated so as to be
# suitable for passing to resolve_cont.
# Trains seem to retain the absolute time zone in which they depart,
# so a train that leaves before 01:00 on the last Sunday in March continues
# to be timed in GMT throughout its journey rather than switching to BST
# at 01:00.

sub fix_offset {
    # DateTime::offset returns an offset in seconds.
    # DateTime::set_time_zone takes an offset in hours and minutes.
    # I sigh.
    my ($dt) = @_;
    my $off = $dt->offset;
    use integer;
    $off = sprintf("%+03d%02d", $off / 3600, ($off / 60) % 60);
    $dt->set_time_zone($off);
}

sub settime {
    my ($base, $time) = @_;
    return undef unless defined nullify($time);
    my ($hh, $mm, $h) = $time =~ /^(\d\d)(\d\d)(H?)/;
    return $base->set(hour => $hh, minute => $mm, second => 30*!!$h);
}

sub resolve_start {
    my ($base, $time) = @_;
    return undef unless defined nullify($time);
    settime($base, $time);
    fix_offset($base);
    return $base->clone;
}

# For later stops, the first argument is a time updated by resolve_start
# or resolve_cont.
sub resolve_cont {
    my ($base, $time) = @_;
    my $was = $base->clone;
    return undef unless defined nullify($time);
    settime($base, $time);
    $base->add(days => 1) if ($base < $was);
    return $base->clone;
}

sub stops {
    my $self = shift;
    return @{$self->{stops}};
}

package GBTrains::Location;
use Class::Field qw/field/;
field 'li';
field 'sched_arr_time';
field 'sched_pass';
field 'sched_dep_time';
field 'public_arr_time';
field 'public_dep_time';    

1;
