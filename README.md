# Scottish Power Tech Test

This is the application that I made as the Tech Test for the Scottish Power.

## About

The application is composed of two screens, one for showing the list 
of rock tracks returned from the iTunes API and the other one 
for showing the details of the selected track on the list.

## Architecture

The MVP (Model View Presenter) design pattern was chosen because of it's simplicity, modularity and the possibilities to doing 
unit testing that are not always possible using the MVC (Model View Controller) pattern.

## Running the tests

The application is tested using the XCTest framework, for both unit testing and user interface testing.

Both tests should run within Xcode.
