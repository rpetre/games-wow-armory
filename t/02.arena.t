#!/usr/bin/perl -w

use strict;
use Test::More tests => 8;
use Games::WoW::Armory;
use Data::Dumper;

## note: these tests depend on volatile data, since arena teams might come and go

my $arena = Games::WoW::Armory->new();
$arena->search_team({team => 'Ne me kitte pas', ts => 2, country => 'EU', realm => 'Elune'});
is ($arena->team->name, 'Ne me kitte pas', 'Team name');
is ($arena->team->size, 2, 'Team Size');
is ($arena->team->battleGroup, 'Cataclysme / Cataclysm', 'Battlegroup name');
is ($arena->team->realm, 'Elune', 'Realm name');

# try a team with a single member, this one is one as of Apr 14, 2010
my $arena_single = Games::WoW::Armory->new();
$arena_single->search_team({team => 'Faceroll ohne Equip', ts => 2, country => 'EU', realm => 'Anub\'arak'});
is ($arena_single->team->name, 'Faceroll ohne Equip', 'Team name');
is ($arena_single->team->size, 2, 'Team Size');
is ($arena_single->team->battleGroup, 'Raserei / Frenzy', 'Battlegroup name');
is ($arena_single->team->realm, 'Anub\'arak', 'Realm name');
