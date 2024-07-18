Feature: Ana sayfa kontrolleri

  @smoke @header @aritma
  Scenario Outline: Test09- Su Aritma kategorisinde olmasi gereken basliklarin kontrolu
    When I see "HomePage" page
    Then I go to url:"<url>"
    And I sleep for 5 seconds
    Then I wait "uyelik button" element
    Then I sleep for 3 seconds
    When I see "HomePage" page
    Then I wait until element to be clickable and click to "urunler button" element
    Then I sleep for 2 seconds
    When I see "HomePage" page
    Then I sleep for 2 seconds
    And I wait until element to be clickable and click to "Su aritma" element
    When I see "Aritma" page
    Then I sleep for 7 seconds
    Then I wait "Su Aritma 1;Su Aritma 2;Su Aritma 3" elements
    And I wait "Sol Panel Header Text" element
    Then I sleep for 5 seconds


    Examples:
      | url                                        |
      | https://akamai-s1-astra-stage.beko.com.tr/ |

