Deck = {};
Cards = {};

local materialPath = "playing_cards/{suit}_{rank}_white.png";

local Ranks = { "A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King" };

-- Not a fan of this naming, but I can't be bothered to change all the texture names
local Suits = {
	"Hearts",
	"Tiles",
	"Clovers",
	"Pikes"
};

-- Generate cards to save time
for i = 1, #Ranks do
	local currentRank = Ranks[ i ];

	Cards[ currentRank ] = {
		value = math.min( i, 10 ),
		Materials = {};
	};
	
	for j = 1, 4 do
		local currentSuit = Suits[ j ];
	
		local materialString = materialPath;
		
		materialString = string.Replace( materialString, "{suit}", currentSuit );
		materialString = string.Replace( materialString, "{rank}", currentRank );
		
		if( SERVER )then
			resource.AddSingleFile( "materials/"..materialString );
		else
			Cards[ currentRank ].Materials[ currentSuit ] = Material( materialString );
		end
	end
end