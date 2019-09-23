
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


##My Approach##

* I started off by tidying up the folder, separating the tests from the code. I then went over the requirements of the Kata so I could make sense of the legacy code and plan an approach to the refactoring.

* I then wrote tests that covered all of the existing legacy code (downloading simplecov to help).

* I then refactored the update_quality method in the GildedRose class, simplyfing the code into a series of if/else statements. This made the code slightly more DRY, as the legacy code was quite repetative, and as a result, twice the length it needed to be. I also added in a few guard clauses at the top of the method which helped to clean things up.

* I then added tests for the Conjured items and then added code to the update_quality method accordingly.

* I then created a new file for the item class. I considered trying to stub out the item class, however I thought it was best to leave mocking until i have fully refactored and I have a clear idea of the different classes and how they work together.
<!-- (the attr of a class should only be written by the owner of that class. If you want to update an attr of a class instance variable, send a request to that class, rather than updating the attr in a different class (i.e. dont have ite,.sell_in in the update method, rather call a method e.g. depreciate, which execites a method in the item class that updates (or if im not allowed to add code to item, another item class that inherits from the main item class)) ) -->

 * I then began to extract a class for each item, with each class inheriting from the item class itself (the requirements are for the main item class to be left untouched). I also made sure that anywhere where an attribute of a class needed to be written, it was done by the class itself rather than the update method in the GildedRose class. I made sure to run the tests every time I changed the code when extracting the classes.

 * I now had tests passing for all the extracted classes. However, the fetaure tests were not working accurately, as I no longer had a way of updating each item through the GildedRose class. I therefore opted to interate over the items in the initialize method of the GildedRose class, as all the update functionality happens directly in the item classes, as these are inherited from the main item class. 
