@javascript
Feature: Smoke Test

  Scenario: A user can view items, add to cart, view cart and pay for item.
    Given a user views a shop with a categories and products
    And a user adds the product to the cart
    Then a user can pay for the product