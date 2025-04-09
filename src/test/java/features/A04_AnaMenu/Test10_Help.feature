Feature: Ana menü kontrolleri

  @smoke @destek @main
  Scenario Outline: Test10- Destek
    When I see "HomePage" page
    Then I go to "<url>" with configuration
    Then I sleep for 3 seconds
    Then I wait until element to be clickable and click to "Cerezleri kabul et" element
    Then I wait "uyelik button" element
    Then I sleep for 3 seconds
    When I see "HomePage" page
    And I wait "Destek" element
    And I wait until element to be clickable and click to "Destek" element
    And I sleep for 3 seconds
    When I see "Destek" page
    #And I wait "Beyaz esya;Ankastre;Tv ve Unitesi;Elektronik;Isitma Sogutma;Kucuk ev aletleri;Online Alisveris" elements
    And I wait "Destek text" element
    And I wait "Destek kaydi ac button" element
    And I scroll until find "Destek kaydi ac button" element with action
    And I wait "Bize yazin" element
    And I wait "whatsapp" element
    And I wait "Canli destek" element
    And I wait "Bana en yakin servis" element



    Examples:
      | url |
      | url |

