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


Instead of examining a quantity of zorkmids:
	say "There are ";
	say the zorkmid content of the noun;
	say " here."

Rule for printing the name of a quantity of zorkmids (called Q):
	say the zorkmid content of Q;

[ Before examining: 
	if the noun is a container and the noun is not the holder of the player:
		if the zorkmid content of the noun > $0:
			now the zorkmid content of the quantity of zorkmids is the zorkmid content of the noun;
			now the quantity of zorkmids is contained by the noun; ]
			
[ Before printing the locale description (this is the add zorkmids rule):
	if the zorkmid content of the location > $0:
		now the zorkmid content of the quantity of zorkmids is the zorkmid content of the location;
		now the quantity of zorkmids is in the location; ]

[ The add zorkmids rule is listed before the find notable locale objects rule in the before printing the locale description rules. ]
			
[ After examining:
	now the quantity of zorkmids is nowhere;
	continue the action; ]
			
[ Before printing room description details of a container (called the holder):
	if the zorkmid content of the holder > $0:
		now the zorkmid content of the quantity of zorkmids is the zorkmid content of the holder;
		now the quantity of zorkmids is contained by the holder; ]

[After printing room description details of a container:
	now the quantity of zorkmids is nowhere;]

[ Before taking inventory:
	if the zorkmid content of the player > $0:
		now the player carries the quantity of zorkmids;
		now the zorkmid content of the quantity of zorkmids is the zorkmid content of the player; ]

[ After taking inventory:
	now the quantity of zorkmids is nowhere;
	continue the action; ]

Check taking a quantity of zorkmids (this is the no stealing rule):
	if the holder of the noun is a person and the holder of the noun is not the player:
		say "That seems to belong to [the holder of the noun]." instead;

appropriating-taking is a truth state that varies. appropriating-taking is false.

Check taking a quantity of zorkmids:
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
		
Carry out appropriating:
	if the zorkmid content of the holder of the player >= the quantity of money understood:
		now the zorkmid content of the holder of the player is the zorkmid content of the holder of the player minus the quantity of money understood;
		now the zorkmid content of the player is the zorkmid content of the player plus the quantity of money understood;
	[ otherwise:
		let total money appropriated be 0;
		let upwards frontier be a list of things;
		let downwards frontier be a list of things;
		add the holder of the player to the upwards frontier;
		add the holder of the player to the downwards frontier; ]



	[ now the zorkmid content of the holder of the player is the zorkmid content of the holder of the player minus the quantity of money understood;
	now the zorkmid content of the player is the zorkmid content of the player plus the quantity of money understood; ]

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

Report appropriating it from:
	if appropriating-taking is true:
		say "Taken (from [the second noun]).";
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


[ For printing a locale paragraph about a thing (called the item)
	(this is the new describe what's on scenery supporters in room descriptions rule):
	if the item is scenery and the item does not enclose the player:
		if the zorkmid content of the item > $0 and the item is not listed in the already described zorkmids:
			now the zorkmid content of the quantity of zorkmids is the zorkmid content of the item;
			now the quantity of zorkmids is on the item;
			now the quantity of zorkmids is unmentioned;
			now the quantity of zorkmids is marked for listing;
			add the item to the already described zorkmids;
		if a locale-supportable thing is on the item:
			set pronouns from the item;
			repeat with possibility running through things on the item:
				now the possibility is marked for listing;
				if the possibility is mentioned:
					now the possibility is not marked for listing;
			increase the locale paragraph count by 1;
			say "On [the item] " (A);
			list the contents of the item, as a sentence, including contents,
				giving brief inventory information, tersely, not listing
				concealed items, prefacing with is/are, listing marked items only;
			say ".[paragraph break]";
	now the quantity of zorkmids is nowhere;
	continue the activity.

The new describe what's on scenery supporters in room descriptions rule is listed instead of the describe what's on scenery supporters in room descriptions rule in the for printing a locale paragraph about rules.

For printing a locale paragraph about a thing (called the item)
	(this is the new describe what's on mentioned supporters in room descriptions rule):
	if the item is mentioned and the item is not undescribed and the item is
		not scenery and the item does not enclose the player:
		if the zorkmid content of the item > $0 and the item is not listed in the already described zorkmids:
			now the zorkmid content of the quantity of zorkmids is the zorkmid content of the item;
			now the quantity of zorkmids is on the item;
			now the quantity of zorkmids is unmentioned;
			now the quantity of zorkmids is marked for listing;
			add the item to the already described zorkmids;
		if a locale-supportable thing is on the item:
			set pronouns from the item;
			repeat with possibility running through things on the item:
				now the possibility is marked for listing;
				if the possibility is mentioned:
					now the possibility is not marked for listing;
			increase the locale paragraph count by 1;
			say "On [the item] " (A);
			list the contents of the item, as a sentence, including contents,
				giving brief inventory information, tersely, not listing
				concealed items, prefacing with is/are, listing marked items only;
			say ".[paragraph break]";
	now the quantity of zorkmids is nowhere;
	continue the activity.

The new describe what's on mentioned supporters in room descriptions rule is listed instead of the describe what's on mentioned supporters in room descriptions rule in the for printing a locale paragraph about rulebook.

For printing the locale description (this is the new you-can-also-see rule):
	let the domain be the parameter-object;
	let the mentionable count be 0;
	repeat with item running through things:
		now the item is not marked for listing;
	repeat through the Table of Locale Priorities:
		if the locale description priority entry is greater than 0,
			now the notable-object entry is marked for listing;
		increase the mentionable count by 1;
	if the zorkmid content of the domain > $0 and the domain is not listed in the already described zorkmids:
		now the zorkmid content of the quantity of zorkmids is the zorkmid content of the domain;
		now the quantity of zorkmids is in the domain;
		now the quantity of zorkmids is unmentioned;
		now the quantity of zorkmids is marked for listing;
		add the domain to the already described zorkmids;
		increase the mentionable count by 1;
	if the mentionable count is greater than 0:
		repeat with item running through things:
			if the item is mentioned:
				now the item is not marked for listing;
		begin the listing nondescript items activity with the domain;
		if the number of marked for listing things is 0:
			abandon the listing nondescript items activity with the domain;
		otherwise:
			if handling the listing nondescript items activity with the domain:
				if the domain is the location:
					say "[We] " (A);
				otherwise if the domain is a supporter or the domain is an animal:
					say "On [the domain] [we] " (B);
				otherwise:
					say "In [the domain] [we] " (C);
				if the locale paragraph count is greater than 0:
					say "[regarding the player][can] also see " (D);
				otherwise:
					say "[regarding the player][can] see " (E);
				let the common holder be nothing;
				let contents form of list be true;
				repeat with list item running through marked for listing things:
					if the holder of the list item is not the common holder:
						if the common holder is nothing,
							now the common holder is the holder of the list item;
						otherwise now contents form of list is false;
					if the list item is mentioned, now the list item is not marked for listing;
				filter list recursion to unmentioned things;
				if contents form of list is true and the common holder is not nothing,
					list the contents of the common holder, as a sentence, including contents,
						giving brief inventory information, tersely, not listing
						concealed items, listing marked items only;
				otherwise say "[a list of marked for listing things including contents]";
				if the domain is the location, say " here" (F);
				say ".[paragraph break]";
				unfilter list recursion;
			end the listing nondescript items activity with the domain;
	now the quantity of zorkmids is nowhere;
	continue the activity.

The new you-can-also-see rule is listed instead of the you-can-also-see rule in the for printing the locale description rules.

For printing a locale paragraph about a thing (called the item)
	(this is the new use initial appearance in room descriptions rule):
	if the item is not mentioned:
		if the item provides the property initial appearance and the
			item is not handled and the initial appearance of the item is
			not "":
			increase the locale paragraph count by 1;
			say "[initial appearance of the item]";
			say "[paragraph break]";
			if the zorkmid content of the item > $0 and the item is not listed in the already described zorkmids:
				now the zorkmid content of the quantity of zorkmids is the zorkmid content of the item;
				now the quantity of zorkmids is on the item;
				now the quantity of zorkmids is unmentioned;
				now the quantity of zorkmids is marked for listing;
				add the item to the already described zorkmids;
			if a locale-supportable thing is on the item:
				repeat with possibility running through things on the item:
					now the possibility is marked for listing;
					if the possibility is mentioned:
						now the possibility is not marked for listing;
				say "On [the item] " (A);
				list the contents of the item, as a sentence, including contents,
					giving brief inventory information, tersely, not listing
					concealed items, prefacing with is/are, listing marked items only;
				say ".[paragraph break]";
			now the item is mentioned;
	now the quantity of zorkmids is nowhere;
	continue the activity.

The new use initial appearance in room descriptions rule is listed instead of the use initial appearance in room descriptions rule in the for printing a locale paragraph about rules.

The last for printing a locale paragraph about rule:
	truncate the already described zorkmids to 0 entries;

Report an actor opening (this is the new reveal any newly visible interior rule):
	if the zorkmid content of the noun > $0:
		now the zorkmid content of the quantity of zorkmids is the zorkmid content of the noun;
		now the quantity of zorkmids is in the noun;
	if the actor is the player and
		the noun is an opaque container and
		the first thing held by the noun is not nothing and
		the noun does not enclose the actor:
		if the action is not silent:
			if the actor is the player:
				say "[We] [open] [the noun], revealing " (A);
				list the contents of the noun, as a sentence, tersely, not listing
					concealed items;
				say ".";
		now the quantity of zorkmids is nowhere;
		stop the action.
	now the quantity of zorkmids is nowhere;

The new reveal any newly visible interior rule is listed instead of the reveal any newly visible interior rule in the report opening rules.

Before listing contents of something (called the holder):
	if the zorkmid content of the holder > $0 and the holder is not the holder of the player:
		now the zorkmid content of the quantity of zorkmids is the zorkmid content of the holder;
		now the quantity of zorkmids is in the holder; ]

[ The sneaky rulebook is an object based rulebook.

First sneaky rule (this is the sneaky nothing rule):
	if the zorkmid content of the holder of the player > $0:
		now the zorkmid content of the quantity2 of zorkmids is the zorkmid content of the holder of the player;
		now the quantity2 of zorkmids is in the holder of the player;

First sneaky rule on something (called T) (this is the sneaky zorkmid rule):
	if T is not the quantity of zorkmids:
		if the zorkmid content of T > $0:
			now the zorkmid content of the quantity of zorkmids is the zorkmid content of T;
			now the quantity of zorkmids is in T;

First sneaky rule (this is the sneaky reset rule):
	now the quantity2 of zorkmids is nowhere;

Every turn:
	now the quantity2 of zorkmids is nowhere. ]

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
				[ say "getting next quantity for [item]: "; ]
				let this quantity be the next quantity;
				now the zorkmid content of this quantity is the zorkmid content of the item;
				increase total quantity by the zorkmid content of the item;
				now this quantity is in the item;
			otherwise if the item is a supporter:
				[ say "getting next quantity for [item]: "; ]
				let this quantity be the next quantity;
				now the zorkmid content of this quantity is the zorkmid content of the item;
				increase total quantity by the zorkmid content of the item;
				now this quantity is on the item;
	repeat with P running through visible people:
		if the zorkmid content of P > $0:
			[ say "getting next quantity for [P]: "; ]
			let this quantity be the next quantity;
			now the zorkmid content of this quantity is the zorkmid content of P;
			increase total quantity by the zorkmid content of P;
			now this quantity is in P;
	if the zorkmid content of the location > $0:
		[ say "getting next quantity for location: "; ]
		let this quantity be the next quantity;
		now the zorkmid content of this quantity is the zorkmid content of the location;
		increase total quantity by the zorkmid content of the location;
		now this quantity is in the location;
	[ say "number of quantities: [number of entries in used quantities], [number of entries in all quantities].";		 ]

To remove quantities:
	while the number of entries in used quantities is not 0:
		let item be entry 1 of used quantities;
		[ say "removing [item] from used quantities: [holder of item]."; ]
		now item is nowhere;
		remove item from used quantities;
		add item to all quantities;
	[ say "number of quantities: [number of entries in used quantities], [number of entries in all quantities].";		 ]


To decide which quantity of zorkmids is the next quantity:
	[ say "number of quantities: [number of entries in used quantities], [number of entries in all quantities].";		 ]
	if the number of entries in all quantities is not 0:
		[ say "OK."; ]
		let NQ be entry 1 of all quantities;
		remove NQ from all quantities;
		add NQ to used quantities;
		decide on NQ;
	otherwise:
		[ say "cloning new quantity."; ]
		let new quantity be a new object cloned from the original quantity;
		add new quantity to used quantities;
		decide on new quantity.

Zorkmids ends here.