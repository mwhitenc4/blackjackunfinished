Blackjack_PanelID = {
	PLAYER = 1,
	DEALER = 2
};

function Blackjack_RunningTotal( tableOfCards )
	local total = 0;
	local hasAce = false;
	
	for k,v in pairs( tableOfCards )do
		if( v.rank == "A" )then
			hasAce = true;
		end
		total = total + Cards[ v.rank ].value;
	end
	
	-- Allows for soft, and hard aces
	if( hasAce && total + 10 <= 21 )then
		total = total + 10;
	end
	
	return total;
end