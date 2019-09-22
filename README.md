
##Instructions/requirements##

* I need to refactor a system that is in place to update the inventory of items.
* All items have a SellIn value which denotes the number of days we have to sell the item.
* All items have a Quality value which denotes how valuable the item is.
* At the end of each day the system lowers both values for every item.

###Normal items###

* Once the sell by date has passed, Quality degrades twice as fast
* The Quality of an item is never negative
* The Quality of an item is never more than 50

###Aged Brie###
* increases in Quality the older it gets

###Sulfuras###
* being a legendary item, never has to be sold or decreases in Quality
* its Quality is 80 and it never alters

###Backstage passes ###
* like aged brie, increases in Quality as its SellIn value approaches
* Quality increases by 2 when there are 10 days or less
* Quality increases by 3 when there are 5 days or less
* Quality drops to 0 after the concert

###Conjured items ###
* degrade in Quality twice as fast as normal items
