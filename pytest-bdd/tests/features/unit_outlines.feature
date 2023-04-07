@unit @outline @basket
Feature: Cucumber Basket with Outlines
  As a gardener,
  I want to carry multiples of cucumbers in a basket,
  So that I don't drop any of them.

  # This feature shows how to use Scenario Outlines for parametrized tests.
  # Outlines require extra step definition code to run.
  # They also require unique step decorators that are incompatible with regular step functions.

  @add
  Scenario Outline: Add cucumbers to a basket
    Given the basket has "<initial>" cucumbers
    When "<some>" cucumbers are added to the basket
    Then the basket contains "<total>" cucumbers

    Examples:
      | initial | some | total |
      | 0       | 3    | 3     |
      | 2       | 4    | 6     |
      | 5       | 5    | 10    |
      # testes negativos
      | -5      | 5    |   0   |
      | 3       | -1   |   2   |
      | 3       |  -4  |   -1  |
      | -5      |  -5  |   -10 |
      # não numérico (erro)
      |  a      |  b   |   c   |
  @remove
  Scenario Outline: Remove cucumbers from the basket
    Given the basket has "<initial>" cucumbers
    When "<some>" cucumbers are removed from the basket
    Then the basket contains "<total>" cucumbers

    Examples:
      | initial | some | total |
      | 8       | 3    | 5     |
      | 10      | 4    | 6     |
      | 7       | 0    | 7     |
      # total == e < 0
      | 5       |  5   |   0   |
      | 5       | 6    |  -1   |
      # testes negativos
      | -5      | 5    |   -10 |
      | 3       | -1   |   4   |
      | 3       |  -4  |   7   |
      | -5      |  -5  |   0   |
      # não numérico (erro)
      |  a      |  b   |   c   |
