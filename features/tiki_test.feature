Feature: Search and Add functionality   

    As an User, i want to go to tiki.vn, search for "apple", pick random item, add to cart, then recheck the cart.

    Scenario: Search and Add 
    Given user go to tiki.vn
    When user search and add to cart
    Then user recheck items in cart