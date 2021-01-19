# Enigma
Turing Mod1 final solo project

* Functionality:
  * I have successfully implemented both the encrypt and decrypt methods, as well as the CLI for both.
  * Encrypt can add a random key if none is given along with todays date if not specified in the argument.
  * Both methods are able to bypass any special characters alowing for any length of text to be both encrypted and decrypted through the CLI.
  * All letters in the specified array return lowercase as specified.

  Score: 3

* Object Oriented Programming:
  * Code is properly encapsulated with inheritance being implemented.
  * I chose to make enigma a child of the caesar cipher class because I felt that the enigma was looking for a more specific return type where the caeser cipher class provides a maliable framework of methods for other types of potential encyption/decription outcomes.
  * Both classes are under 100 lines in length and provide at least four methods.
  * Each method has a single responsability.

  Score: 4

* Ruby Conventions and Mechanics
  * Each method and class represents what what job it has.
  * Proper syntax has been used(naming conventions, indentation)
  * I have used several hashes that allow for the keys to be split with ease.
  * I didn't find much iteration neccessary, but found map.with_index useful.
  * No methods extend pass 9 lines.

  Grade: 3.5

*Test Driven Development:
  * Tests have been written for every method.
  * These tests had edge-casing in mind.
  * Tests come first!
  * Test coverage is at 100%
  * stubs were implemented properly

  Grade: 3.5

* Version Control:
  * 48 commits.
  * Always worked on branches and used new branches for small pieces of functionality.
  * Commit messages are informative of the tasks completed.