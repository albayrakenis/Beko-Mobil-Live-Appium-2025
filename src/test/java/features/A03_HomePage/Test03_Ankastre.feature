Feature: Ana sayfa kontrolleri

  @smoke @header @ankastre
  Scenario Outline: Test03- Ankastre kategorisinde olmasi gereken basliklarin kontrolu
    When I see "HomePage" page
    Then I go to url:"<url>"
    Then I wait "uyelik button" element
    When I see "HomePage" page
    Then I wait until element to be clickable and click to "urunler button" element
    When I see "HomePage" page
    And I wait until element to be clickable and click to "Ankastre" element
    When I see "Ankastre" page
    Then I wait "Ankastre Text;Ankastre Bulasik Makineleri;Ankastre Davlumbaz;Ankastre Firin;Ankastre Kurutmali Camasir Makinesi;Ankastre Set" elements
    And I wait "Sol Panel Header Text" element
    Then I sleep for 1 seconds


    Examples:
      | username             | password    | url                                        |
      | beko.s1test@gmail.com | Albayrak.41 | https://akamai-s1-astra-stage.beko.com.tr/ |

