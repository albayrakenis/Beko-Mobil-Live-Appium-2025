Feature: Ana menü kontrolleri

  @smoke @footer @main
  Scenario Outline: Test03- Footer
    When I see "HomePage" page
    Then I go to url:"<url>"
    Then I wait "uyelik button" element
    Then I sleep for 3 seconds
    When I see "Footer" page
    And I scroll until find "Teknik destek footer" element with action
    And I wait "Urunler footer;Kurumsal footer;Destek footer;Hizmet footer;Cagri merkezi footer;Teknik destek footer" elements
    And I sleep for 5 seconds



    Examples:
      | username             | password    | url                                        |
      | beko.s1test@gmail.com | Albayrak.41 | https://akamai-s1-astra-stage.beko.com.tr/ |

