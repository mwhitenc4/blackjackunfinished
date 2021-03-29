local ReferenceResolution = { x = 1920, y = 1080 };
CardPanel = CardPanel || {};
CardPanel.Instances = CardPanel.Instances || {};

function RefResX( x )
	return (ScrW() / ReferenceResolution.x) * x;
end

function RefResY( y )
	return (ScrH() / ReferenceResolution.y) * y;
end

-- This will add a new card to the panel
function CardPanel:AddCard( card )
	card.panel = vgui.Create( "DImage", self );
	card.panel:SetMaterial( Cards[ card.rank ].Materials[ card.suit ] );

	table.insert( self.Cards, card );
	
	self:UpdateLayout();
end

-- This will remove an existing card from the panel
function CardPanel:RemoveCard( rank, suit )
	for k,v in pairs( self.Cards )do
		if( v.rank == rank && v.suit == suit )then
			v.panel:Remove();
		
			table.remove( self.Cards, k );
			return;
		end
	end
	
	self:UpdateLayout();
end

function CardPanel:UpdateLayout()
	local spacing = RefResX( 20 );

	local totalCards = #self.Cards;
	local refX = RefResX( 131 );
	local refY = RefResY( 186 );

	self:SetSize( ( refX + spacing ) * totalCards - spacing, refY );
	
	for k,v in ipairs( self.Cards )do
		v.panel:SetSize( refX, refY );
		v.panel:SetPos( ( refX + spacing ) * ( k -  1), 0 );
	end
	
	self:CenterHorizontal();
	
	local parent = self:GetParent();
	
	if( IsValid( parent ) && parent.UpdateLayout )then
		parent:UpdateLayout();
	end
end

function CardPanel:Initialize(id, parent)
	id = id || 1;

	local panel = vgui.Create( "DPanel", parent );
	
	panel.id = id;
	
	if(CardPanel.Instances[ id ])then
		CardPanel.Instances[ id ]:Remove();
	end
	
	CardPanel.Instances[ id ] = panel;
	panel.AddCard = CardPanel.AddCard;
	panel.RemoveCard = CardPanel.RemoveCard;
	panel.UpdateLayout = CardPanel.UpdateLayout;
	
	function panel:Paint() end -- Disable drawing of background panel
	-- Remove references on deletion
	
	function panel:OnRemove()
		CardPanel.Instances[ self.id ] = nil;
		
		if( IsValid(parent) )then
			parent:Remove();
		end
	end
	
	panel.Cards = {};
	
	return panel;
end

function CardPanel.Find(id)
	
end