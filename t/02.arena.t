#!/usr/bin/perl -w

use strict;
use Test::More tests => 4;
use Games::WoW::Armory;
use Data::Dumper;

my %test_params = (
    dump_xml    => undef,
    local_files => {
        'character-sheet.xml'      => "examples/character.xml",
        'character-reputation.xml' => "examples/reputation.xml",
        'character-arenateams.xml' => "examples/arenateams.xml",
        'guild-info.xml'           => "examples/guild.xml",
        'team-info.xml'            => "examples/team.xml",
    }
);

## note: these tests depend on volatile data, since arena teams might come and go
#TODO: {
#    todo_skip "Arena not working yet", 12 if 1;

    my $arena = Games::WoW::Armory->new(\%test_params);
    $arena->search_team(
        {   team    => 'Ne me kitte pas',
            ts      => 2,
            country => 'EU',
            realm   => 'Elune'
        }
    );
    is( $arena->team->name, 'Ne me kitte pas', 'Team name' );
    is( $arena->team->size, 2, 'Team Size' );
    is( $arena->team->battleGroup,
        'Cataclysme / Cataclysm',
        'Battlegroup name'
    );
    is( $arena->team->realm, 'Elune', 'Realm name' );

#}
