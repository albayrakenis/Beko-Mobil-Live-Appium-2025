Feature: Ana sayfa kontrolleri

  @smoke @header @markalar
  Scenario Outline: Test10- Markalar kategorisinde olmasi gereken basliklarin kontrolu
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
    And I wait until element to be clickable and click to "Markalar" element
    When I see "Markalar" page
    Then I sleep for 7 seconds
    Then I wait "Apple;Celly;Grundig;Huawei;Hypergear;Lenovo;Philips;Samsung;" elements
    Then I sleep for 5 seconds


    Examples:
      | url                                        |
      | https://akamai-s1-astra-stage.beko.com.tr/ |

