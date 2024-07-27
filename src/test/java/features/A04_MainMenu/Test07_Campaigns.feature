Feature: Ana menü kontrolleri

  @smoke @kampanyalar @main
  Scenario Outline: Test07- Kampanyalar
    When I see "HomePage" page
    Then I go to url:"<url>"
    Then I wait "uyelik button" element
    Then I sleep for 3 seconds
    When I see "HomePage" page
    And I wait "Kampanyalar" element
    And I wait until element to be clickable and click to "Kampanyalar" element
    And I sleep for 2 seconds
    And I wait "Kampanyalar text" element
    And I wait "Size ozel text" element
    And I check "Kampanyalar text" element text is equal "Kampanyalar"
    And I check "Size ozel text" element text is equal "Size Özel"



    And I sleep for 5 seconds



    Examples:
       | url                                        |
       | https://akamai-s1-astra-stage.beko.com.tr/ |

