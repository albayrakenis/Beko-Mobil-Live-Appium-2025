Feature: Ana menü kontrolleri

  @smoke @hediyeCeki @main
  Scenario Outline: Test08- Hediye Ceki
    When I see "HomePage" page
    Then I go to "<url>" with configuration
    Then I sleep for 3 seconds
    Then I wait until element to be clickable and click to "Cerezleri kabul et" element
    Then I wait "uyelik button" element
    Then I sleep for 3 seconds
    When I see "HomePage" page
    #And I wait "Hediye Ceki" element
    #And I wait until element to be clickable and click to "Hediye Ceki" element
    #And I sleep for 3 seconds
    #When I see "HediyeCeki" page
    #And I wait "Online hediye ceki text" element
    #And I check "Online hediye ceki text" element text is equal "Online Hediye Çeki"


    Examples:
      | url |
      | url |

