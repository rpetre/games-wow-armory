#!/usr/bin/perl -w

use strict;
use Test::More tests => 12;
use Games::WoW::Armory;
use Data::Dumper;

use_ok('Games::WoW::Armory');
can_ok('Games::WoW::Armory', 'fetch_data');
can_ok('Games::WoW::Armory', 'search_character');
can_ok('Games::WoW::Armory', 'search_guild');

# warning: these tests depend on players that may move from one guild to another, or change servers, or names, and so on.
# failure to pass tests might simply mean stale data

my $char = Games::WoW::Armory->new();
$char->search_character({realm => "Elune", character => "Astelian", country => "EU"});
is ($char->character->{name}, "Astelian", "Character name ok");
is ($char->character->name, "Astelian", "New character name ok");
is ($char->character->level, 80, "New characterlevel ok");
isa_ok ($char->character->reputation, 'HASH', 'Reputation' );
isa_ok ($char->character->arenaTeams, 'ARRAY', 'Arena Teams');

my $guild = Games::WoW::Armory->new();
$guild->search_guild({realm => "Elune", guild => "Cercle+De+L+Anneau+Rond", country => "EU"});
is ($guild->guild->name, "Cercle De L Anneau Rond", "Guild name");
is ($guild->guild->realm, "Elune", "Realm name");
is ($guild->guild->battleGroup, "Cataclysme / Cataclysm", "Battlegroup name");
