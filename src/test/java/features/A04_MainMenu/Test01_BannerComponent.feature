Feature: Ana menü kontrolleri

  @smoke @banner @main
  Scenario Outline: Test01- Headerda olmasi gereken basliklarin kontrolu
    When I see "HomePage" page
    Then I go to url:"<url>"
    Then I wait "uyelik button" element
    Then I sleep for 3 seconds
    When I see "HomePage" page
    And I wait "Banner next button" element
    And I wait until element to be clickable and click to "Banner next button" element
    And I wait "Banner next button" element
    And I wait until element to be clickable and click to "Banner next button" element
    And I wait "Banner next button" element
    And I wait until element to be clickable and click to "Banner next button" element
    And I wait "Banner next button" element
    And I wait until element to be clickable and click to "Banner next button" element
    And I wait "Banner preview button" element
    And I wait until element to be clickable and click to "Banner preview button" element
    And I wait "Banner preview button" element
    And I wait until element to be clickable and click to "Banner preview button" element
    And I wait "Banner preview button" element
    And I wait until element to be clickable and click to "Banner preview button" element
    And I sleep for 7 seconds




    Examples:
      | username             | password    | url                                        |
      | beko.s1test@gmail.com | Albayrak.41 | https://akamai-s1-astra-stage.beko.com.tr/ |

