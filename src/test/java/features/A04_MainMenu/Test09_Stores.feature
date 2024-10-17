Feature: Ana menü kontrolleri

  @smoke @magazalar @main @son
  Scenario Outline: Test09- Magazalar
    When I see "HomePage" page
    Then I go to url:"<url>"
    Then I wait "uyelik button" element
    Then I sleep for 5 seconds
    When I see "HomePage" page
    And I wait "Magazalar" element
    And I wait until element to be clickable and click to "Magazalar" element
    And I sleep for 2 seconds
    When I see "Magazalar" page
    And I wait "Magazalar text" element
    And I wait "Bana en yakin magaza text" element
    And I wait "Teknik destek ve servis randevusu text" element
    And I check "Teknik destek ve servis randevusu text" element text is equal "Teknik Destek ve Servis Randevusu"
    And I wait "il;ilce;mahalle" elements
    When I see "AdresPage" page
    Then I choose city "ANTALYA" from list
    Then I choose town "KEPEZ" from list
    Then I choose neighborhood "AHATLI" from list
    When I see "Magazalar" page
    And I wait until element to be clickable and click to "Magaza ara button" element
    And I scroll until find "Tum liste" element with action
    And I wait "Tum adresler" element
    And I wait "Tum liste" element
    And I sleep for 5 seconds



    Examples:
       | url                                        |
       | https://akamai-s1-astra-stage.beko.com.tr/ |

