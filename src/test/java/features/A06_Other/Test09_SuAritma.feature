Feature: Ana sayfa kontrolleri

  @smoke @header @aritma
  Scenario Outline: Test09- Su Aritma kategorisinde olmasi gereken basliklarin kontrolu
    When I see "HomePage" page
    Then I go to "<url>" with configuration
    Then I wait until element to be clickable and click to "Cerezleri kabul et" element
    Then I wait "uyelik button" element
    When I see "HomePage" page
    Then I wait until element to be clickable and click to "urunler button" element
    When I see "HomePage" page
    And I wait until element to be clickable and click to "Su aritma" element
    When I see "Aritma" page
    Then I wait "Su Aritma 1;Su Aritma 2;Su Aritma 3" elements
    And I wait "Sol Panel Header Text" element
    Then I sleep for 1 seconds


    Examples:
      | url |
      | url |

