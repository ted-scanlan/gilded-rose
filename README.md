
## Instructions/requirements ##

* I need to refactor a system that is in place to update the inventory of items.
* All items have a SellIn value which denotes the number of days we have to sell the item.
* All items have a Quality value which denotes how valuable the item is.
* At the end of each day the system lowers both values for every item.

#### Normal items ####

* Once the sell by date has passed, Quality degrades twice as fast
* The Quality of an item is never negative
* The Quality of an item is never more than 50

#### Aged Brie ####
* increases in Quality the older it gets

#### Sulfuras ####
* being a legendary item, never has to be sold or decreases in Quality
* its Quality is 80 and it never alters

#### Backstage passes ####
* like aged brie, increases in Quality as its SellIn value approaches
* Quality increases by 2 when there are 10 days or less
* Quality increases by 3 when there are 5 days or less
* Quality drops to 0 after the concert

#### Conjured items ####
* degrade in Quality twice as fast as normal items


## My Approach ##

* I started off by tidying up the folder, separating the tests from the code. I then went over the requirements of the Kata so I could make sense of the legacy code and plan an approach to the refactoring.

* I then wrote tests that covered all of the existing legacy code (downloading simplecov to help).

* I then refactored the update_quality method in the GildedRose class, simplyfing the code into a series of if/else statements. This made the code slightly more DRY, as the legacy code was quite repetative, and as a result, twice the length it needed to be. I also added in a few guard clauses at the top of the method which helped to clean things up.

* I then added tests for the Conjured items and then added code to the update_quality method accordingly.

* I then created a new file for the item class. I considered trying to stub out the item class, however I thought it was best to leave mocking until i have fully refactored and I have a clear idea of the different classes and how they work together.

 * I then began to extract a class for each item, with each class inheriting from the item class itself (the requirements are for the main item class to be left untouched). I also made sure that anywhere where an attribute of a class needed to be written, it was done by the class itself rather than the update method in the GildedRose class. I made sure to run the tests every time I changed the code when extracting the classes.

 * I now had tests passing for all the extracted classes. However, the feature tests were not working accurately, as I no longer had a way of updating each item through the GildedRose class. I therefore opted to map out an array of items in the initialize method reflecting the items inputted into the GildedRose. I then made an update method that executed the update method in the item classes.

* I ran into an issue with the backstage passes, as my functionality did not account for when quality was either 48 or 49, and updating would result in a quality above the maximum of 50. I solved this by factoring in the MAX quality into the update method in the Backstage Passes class.



## Setting up locally ##

First, clone this repository. Then:
```console
cd gilded-rose
bundle install
```

To run tests

```
rspec

```

To run the program
```console
irb
require './gilded_rose'
```

Then create an array of items of your choosing:

```
items = [
  Item.new(name="Aged Brie", sell_in=2, quality=0),
  Item.new(name="Elixir of the Mongoose", sell_in=5, quality=7),
  Item.new(name="Sulfuras", sell_in=0, quality=80),
  Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=15, quality=20),
  Item.new(name="Conjured", sell_in=3, quality=6)
]
```

Then enter the items into the Gilded Rose:

```
gilded_rose = GildedRose.new(items)

```

to update the items:

```
gilded_rose.update_quality

```

(run the 'spec/texttest_fixture.rb' file to see this in action)
