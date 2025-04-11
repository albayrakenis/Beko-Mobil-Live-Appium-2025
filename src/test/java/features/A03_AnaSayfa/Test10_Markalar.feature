Feature: Ana sayfa kontrolleri

    @markalar
  Scenario Outline: Test10- Markalar kategorisinde olmasi gereken basliklarin kontrolu
    When I see "HomePage" page
    Then I go to "<url>" with configuration
    Then I wait until element to be clickable and click to "Cerezleri kabul et" element
    Then I wait "uyelik button" element
    When I see "HomePage" page
    Then I wait until element to be clickable and click to "urunler button" element
    When I see "HomePage" page
    And I wait until element to be clickable and click to "Markalar" element
    When I see "Markalar" page
    Then I wait "Apple;Celly;Grundig;Huawei;Hypergear;Lenovo;Philips;Samsung;" elements
    Then I sleep for 1 seconds


    Examples:
      | url                                        |
      | url |

