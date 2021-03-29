function Deck:Shuffle()
	self.Cards = {};

	for k,v in pairs( Cards )do
		for i = 1, 4 do
			table.insert( self.Cards, { rank = k, suit = Suits[ i ] } )
		end
	end

	for i = 1, 52 do
		local rand = math.random( 1, 52 );
		local storedCard = self.Cards[ i ];
		
		self.Cards[ i ] = self.Cards[ rand ];
		self.Cards[ rand ] = storedCard;
	end
end

function Deck:TakeNext()
	local cardsRemaining = #self.Cards;
	local takenCard = self.Cards[ cardsRemaining ];
	
	table.remove( self.Cards );
	
	-- We shuffle if the last card was just taken
	if(cardsRemaining == 1)then
		self:Shuffle();
	end
	
	return takenCard;
end

function Deck:Initialize()
	local new_instance = {};
	
	new_instance.Shuffle = Deck.Shuffle;
	
	new_instance.TakeNext = Deck.TakeNext;
	
	new_instance:Shuffle();
	
	return new_instance;
end