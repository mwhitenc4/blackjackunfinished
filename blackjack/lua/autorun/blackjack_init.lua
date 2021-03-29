if ( SERVER ) then
	include( "blackjack/sh_deck.lua" );
	include( "blackjack/sv_deck.lua" );
	include( "blackjack/sv_blackjack.lua" );
	AddCSLuaFile( "blackjack/sh_deck.lua" );
	AddCSLuaFile( "blackjack/cl_deck.lua" );
	AddCSLuaFile( "blackjack/sh_blackjack.lua" );
	AddCSLuaFile( "blackjack/cl_blackjack.lua" );
else 
	include( "blackjack/sh_deck.lua" );
	include( "blackjack/cl_deck.lua" );
	include( "blackjack/sh_blackjack.lua" );
	include( "blackjack/cl_blackjack.lua" );
end