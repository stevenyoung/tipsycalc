# Pre-work - *tipsycalc*

**tipsycalc** is a tip calculator application for iOS.

Submitted by: **Steven Young**

Time spent: **4-6(?)** hours spent in total

## User Stories

The following **required** functionality is complete:

* [X] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [X] Settings page to change the default tip percentage.

The following **optional** features are implemented:
* [ ] UI animations
* [ ] Remembering the bill amount across app restarts (if <10mins)
* [ ] Using locale-specific currency and currency thousands separators.
* [ ] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:
* [X] show bill splits between 2-5 parties
- [ ] Not implemented but begun - Support for adding a restaurant name and logging each restaurant, bill, tip, details from your visit to track the quality of your dining out.

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='https://github.com/stevenyoung/tipsycalc/blob/master/tipsycalc/tipsycalc.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Project Analysis

As part of your pre-work submission, please reflect on the app and answer the following questions below:

**Question 1**: "What are your reactions to the iOS app development platform so far? How would you describe outlets and actions to another developer? Bonus: any idea how they are being implemented under the hood? (It might give you some ideas if you right-click on the Storyboard and click Open As->Source Code")

**Answer:** 
Coming from Python, Javascript there are some things I like about Swift in Xcode and other things spin my head. Getting guidance on these features would be welcome. For instance I am accustomed to having to import modules to use them but in Xcode all the classes seem to be available in other files, imported or not. 
On first encounter I think I might describe interface builders outlets as view nodes and its actions as event listeners for these nodes, thinking of them as analogous to DOM nodes and event listeners used in web development.
It seems that they are implemented as nodes in the storyboard XML which also seems to match the DOM model.


Question 2: "Swift uses [Automatic Reference Counting](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/AutomaticReferenceCounting.html#//apple_ref/doc/uid/TP40014097-CH20-ID49) (ARC), which is not a garbage collector, to manage memory. Can you explain how you can get a strong reference cycle for closures? (There's a section explaining this concept in the link, how would you summarize as simply as possible?)"

**Answer:** 
Define a class with a property that is a closure. If that closure captures a reference to an instance property or instance method, then a strong reference cycle can be created. Using self.property to reference a property inside of a closure creates strong references between a class instance and a closure preventing memory deallocation for each. This appears to be easily remedied though.


## License

    Copyright 2017 Steven Young

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
