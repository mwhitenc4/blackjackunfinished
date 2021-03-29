Blackjack_Frame = {};

function Blackjack_Frame:Initialize( parent, id )
	local frame = vgui.Create( "DFrame" );
	frame:SetSize(1, 1); -- Will be based on the size of the card panel
	frame:Center();
	
	frame.CardPanel = CardPanel:Initialize( id, frame );
	frame.CardPanel:SetPos( frame.CardPanel:GetX(), 25 );
	
	-- Not the most elegant method, but it works
	function frame:UpdateLayout()
		if( IsValid( self.CardPanel ) )then
			self:SetSize( self.CardPanel:GetWide(), self.CardPanel:GetTall() + 55 );
			self.CardPanel:CenterHorizontal();
		end
	end
	
	frame.CardPanel:AddCard({rank = "A", suit = "Hearts"});
	frame.CardPanel:AddCard({rank = "2", suit = "Pikes"});
	frame.CardPanel:AddCard({rank = "3", suit = "Clovers"});
	frame.CardPanel:AddCard({rank = "4", suit = "Hearts"});
	
	return frame;
end

Blackjack_Frame:Initialize( nil, Blackjack_PanelID.Player );