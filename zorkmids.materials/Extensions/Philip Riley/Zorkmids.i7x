Zorkmids by Philip Riley begins here.

Include Dynamic Objects by Jesse McGrew.

Quantity of money is kind of value. $1 specifies a quantity of money.

A thing has a Quantity of money called the zorkmid content.
A room has a Quantity of money called the zorkmid content.

The already described zorkmids is a list of things that varies.

quantity of zorkmids is a kind of thing. A quantity of zorkmids is proper-named.

The original quantity is a quantity of zorkmids.

total quantity is a quantity of money that varies. total quantity is $0.

all quantities is a list of things that varies. all quantities is {}.
used quantities is a list of things that varies. used quantities is {}.

Rule for printing the name of a quantity of zorkmids (called Q):
	say the zorkmid content of Q;

Check taking a quantity of zorkmids (this is the no stealing rule):
	if the holder of the noun is a person and the holder of the noun is not the player:
		say "That seems to belong to [the holder of the noun]." instead;

appropriating-taking is a truth state that varies. appropriating-taking is false.

Check taking a quantity of zorkmids (this is the redirect to appropriating rule):
	now appropriating-taking is true;
	try appropriating the zorkmid content of the noun from the holder of the noun instead;

Appropriating is an action applying to one quantity of money. Understand "take [Quantity of money]" as appropriating.
Appropriating it from is an action applying to one quantity of money and one thing. Understand "take [Quantity of money] from [something]" as appropriating it from.

Check appropriating (this is the can't take too much money rule):
	if total quantity < the quantity of money understood:
		say "[There] [aren't] that much money here." instead;
		
Check appropriating (this is the can't take too little money rule):
	if the quantity of money understood is $0:
		say "[We] [can't] take no money at all." instead;
	otherwise if the quantity of money understood < $0:
		say "[We] [can't] take negative money!" instead;

total money appropriated is a quantity of money that varies.
total money required is a quantity of money that varies.
A thing can be marked for appropriation. A thing is usually not marked for appropriation.
A room can be marked for appropriation. A room is usually not marked for appropriation.
appropriation sources is a list of things that varies.
A thing has a quantity of money called the planned appropriation.

To appropriate money starting at (holder - an object):
	appropriate money descending from holder;
	if total money appropriated < total money required:
		if holder is not a room:
			appropriate money starting at the holder of holder;

during-appropriation is a truth state that varies. during-appropriation is false.

To appropriate money descending from (holder - an object):
	if holder is not marked for appropriation:
		now holder is marked for appropriation;
		if the holder is a quantity of zorkmids and the holder of the holder is not the player:
			if zorkmid content of holder > total money required - total money appropriated:
				let money to take be total money required - total money appropriated;
				now appropriating-taking is true;
				now during-appropriation is true;
				say "[money to take]: [run paragraph on]";
				try appropriating money to take from holder of holder;
				now appropriating-taking is false;
				now during-appropriation is false;
				now total money appropriated is total money appropriated + money to take;
			otherwise:
				now appropriating-taking is true;
				now during-appropriation is true;
				say "[zorkmid content of holder]: [run paragraph on]";
				try appropriating the zorkmid content of holder from holder of holder;
				now appropriating-taking is false;
				now during-appropriation is false;
				now total money appropriated is total money appropriated + zorkmid content of holder;
		otherwise if total money appropriated < total money required:
			if holder is a container and the holder is open:
				repeat with item running through things in holder:
					appropriate money descending from item;
			otherwise if holder is a supporter:
				repeat with item running through things on holder:
					appropriate money descending from item;
			otherwise if holder is a room:
				repeat with item running through things in holder:
					appropriate money descending from item;
			otherwise if holder is a person:
				repeat with item running through things carried by the holder:
					appropriate money descending from item;

Carry out appropriating:
	if the zorkmid content of the holder of the player >= the quantity of money understood:
		now the zorkmid content of the holder of the player is the zorkmid content of the holder of the player minus the quantity of money understood;
		now the zorkmid content of the player is the zorkmid content of the player plus the quantity of money understood;
	otherwise:
		repeat with item running through visible things:
			now the item is not marked for appropriation;
		now the location is not marked for appropriation;
		now total money appropriated is $0;
		now total money required is the quantity of money understood;
		now appropriation sources is {};
		appropriate money starting at the holder of the player;
		say appropriation sources;


Report appropriating:
	say "[We] [are] [quantity of money understood] richer!";

Check appropriating it from (this is the can't take too much money from rule):
	if the zorkmid content of the second noun < the quantity of money understood:
		say "[The second noun] doesn't have that much money in it." instead;

Check appropriating it from (this is the can't take too little money from rule):
	if the quantity of money understood is $0:
		say "[We] [can't] take no money at all." instead;
	otherwise if the quantity of money understood < $0:
		say "[We] [can't] take negative money!" instead;

Carry out appropriating it from:
	now the zorkmid content of the second noun is the zorkmid content of the second noun minus the quantity of money understood;
	now the zorkmid content of the player is the zorkmid content of the player plus the quantity of money understood;

To cancel parabreak:
	(- say__p = 0; -)

Report appropriating it from:
	if appropriating-taking is true:
		say "Taken from [the second noun].";
		if during-appropriation is true:
			cancel parabreak;
	otherwise:
		say "Taken.";

Wasting money is an action applying to one quantity of money. Understand "drop [Quantity of money]" as wasting money.

Check wasting money (this is the can't drop too much money rule):
	if the zorkmid content of the player < the quantity of money understood:
		say "[We] [don't] have that much money to drop." instead;

Check wasting money (this is the can't drop too little money rule):
	if the quantity of money understood is $0:
		say "[We] [can't] drop no money at all." instead;
	otherwise if the quantity of money understood < $0:
		say "[We] [can't] drop negative money!" instead;

Carry out wasting money:
	now the zorkmid content of the player is the zorkmid content of the player minus the quantity of money understood;
	now the zorkmid content of the holder of the player is the zorkmid content of the holder of the player plus the quantity of money understood;

Report wasting money:
	say "[We] [are] [quantity of money understood] poorer!";


Donating it to is an action applying to one quantity of money and one thing. Understand "give [Quantity of money] to [someone]" as donating it to.
Depositing it into is an action applying to one quantity of money and one thing. Understand "put [Quantity of money] in/into [something]" as depositing it into.
Depositing it onto is an action applying to one quantity of money and one thing. Understand "put [Quantity of money] on/onto [something]" as depositing it onto.

Check donating (this is the can't give too much money rule):
	if the zorkmid content of the player < the quantity of money understood:
		say "[We] [don't] have that much money to give." instead;

Check donating (this is the can't give too little money rule):
	if the quantity of money understood is $0:
		say "[We] [can't] give no money at all." instead;
	otherwise if the quantity of money understood < $0:
		say "[We] [can't] give negative money!" instead;

Carry out donating:	
	now the zorkmid content of the player is the zorkmid content of the player minus the quantity of money understood;
	now the zorkmid content of the second noun is the zorkmid content of the second noun plus the quantity of money understood;

Report donating:
	say "[We] [are] [quantity of money understood] poorer!";

Check depositing it into (this is the can't deposit too much money rule):
	if the zorkmid content of the player < the quantity of money understood:
		say "[We] [don't] have that much money." instead;

Check depositing it into (this is the can't deposit too little money rule):
	if the quantity of money understood is $0:
		say "[We] [can't] leave no money at all." instead;
	otherwise if the quantity of money understood < $0:
		say "[We] [can't] leave negative money!" instead;

Carry out depositing it into:
	now the zorkmid content of the player is the zorkmid content of the player minus the quantity of money understood;
	now the zorkmid content of the second noun is the zorkmid content of the second noun plus the quantity of money understood;

Report depositing it into:
	say "[We] [have] left [quantity of money understood] in [the second noun], and [we] [are] [quantity of money understood] poorer!";

Check depositing it onto (this is the can't deposit too much money on rule):
	if the zorkmid content of the player < the quantity of money understood:
		say "[We] [don't] have that much money." instead;

Check depositing it onto (this is the can't deposit too little money pn rule):
	if the quantity of money understood is $0:
		say "[We] [can't] leave no money at all." instead;
	otherwise if the quantity of money understood < $0:
		say "[We] [can't] leave negative money!" instead;

Carry out depositing it onto:
	now the zorkmid content of the player is the zorkmid content of the player minus the quantity of money understood;
	now the zorkmid content of the second noun is the zorkmid content of the second noun plus the quantity of money understood;

Report depositing it onto:
	say "[We] [have] left [quantity of money understood] on [the second noun], and [we] [are] [quantity of money understood] poorer!";

When play begins:
	populate quantities.
	
Before reading a command:
	remove quantities;
	populate quantities.

After going:
	remove quantities;
	populate quantities;
	continue the action.

To populate quantities:
	now total quantity is $0;
	repeat with item running through visible things:
		if the zorkmid content of the item > $0:
			if the item is a container:
				let this quantity be the next quantity;
				now the zorkmid content of this quantity is the zorkmid content of the item;
				if the item is open:
					increase total quantity by the zorkmid content of the item;
				now this quantity is in the item;
			otherwise if the item is a supporter:
				let this quantity be the next quantity;
				now the zorkmid content of this quantity is the zorkmid content of the item;
				increase total quantity by the zorkmid content of the item;
				now this quantity is on the item;
	repeat with P running through visible people:
		if the zorkmid content of P > $0:
			let this quantity be the next quantity;
			now the zorkmid content of this quantity is the zorkmid content of P;
			now this quantity is in P;
	if the zorkmid content of the location > $0:
		let this quantity be the next quantity;
		now the zorkmid content of this quantity is the zorkmid content of the location;
		increase total quantity by the zorkmid content of the location;
		now this quantity is in the location;

To remove quantities:
	while the number of entries in used quantities is not 0:
		let item be entry 1 of used quantities;
		now item is nowhere;
		remove item from used quantities;
		add item to all quantities;


To decide which quantity of zorkmids is the next quantity:
	if the number of entries in all quantities is not 0:
		let NQ be entry 1 of all quantities;
		remove NQ from all quantities;
		add NQ to used quantities;
		decide on NQ;
	otherwise:
		let new quantity be a new object cloned from the original quantity;
		add new quantity to used quantities;
		decide on new quantity.

Zorkmids ends here.