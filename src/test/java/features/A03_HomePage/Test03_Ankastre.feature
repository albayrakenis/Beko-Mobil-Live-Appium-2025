Feature: Ana sayfa kontrolleri

  @smoke @header @ankastre
  Scenario Outline: Test03- Beyaz Esya kategorisinde olmasi gereken basliklarin kontrolu
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
    And I wait until element to be clickable and click to "Ankastre" element
    When I see "Ankastre" page
    Then I sleep for 7 seconds
    Then I wait "Ankastre Text;Ankastre Bulasik Makineleri;Ankastre Davlumbaz;Ankastre Firin;Ankastre Kurutmali Camasir Makinesi;Ankastre Set" elements
    And I wait "Sol Panel Header Text" element
    Then I sleep for 5 seconds


    Examples:
      | username             | password    | url                                        |
      | bekos1test@gmail.com | Albayrak.41 | https://akamai-s1-astra-stage.beko.com.tr/ |

