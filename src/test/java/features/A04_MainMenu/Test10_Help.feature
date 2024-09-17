Feature: Ana menü kontrolleri

  @smoke @destek @main
  Scenario Outline: Test10- Destek
    When I see "HomePage" page
    Then I go to url:"<url>"
    Then I wait "uyelik button" element
    Then I sleep for 3 seconds
    When I see "HomePage" page
    And I wait "Destek" element
    And I wait until element to be clickable and click to "Destek" element
    And I sleep for 2 seconds
    When I see "Destek" page
    And I wait "Beyaz esya;Ankastre;Tv ve Unitesi;Elektronik;Isıtma Sogutma;Kucuk ev aletleri;Online Alisveris" elements
    And I wait "Destek text" element
    And I wait "Destek box" element
    And I scroll until find "Destek kaydi ac" element with action
    And I send key to "Destek box" element text:"ab"



    Examples:
       | url                                        |
       | https://akamai-s1-astra-stage.beko.com.tr/ |

