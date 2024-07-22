Feature: Ana sayfa kontrolleri

  @smoke @header @beyazesya
  Scenario Outline: Test02- Beyaz Esya kategorisinde olmasi gereken basliklarin kontrolu
    When I see "HomePage" page
    Then I go to url:"<url>"
    And I sleep for 5 seconds
    Then I wait "uyelik button" element
    Then I sleep for 3 seconds
    When I see "HomePage" page
    Then I wait until element to be clickable and click to "urunler button" element
    Then I sleep for 2 seconds
    When I see "HomePage" page
    Then I wait "Beyaz esya;Ankastre;Televizyon;Elektronik;isitma sogutma;" elements
    Then I wait "KEA;Hijyen Aksesuar;Su aritma;Markalar;" elements
    Then I sleep for 8 seconds
    And I wait until element to be clickable and click to "Beyaz esya" element
    When I see "BeyazEsya" page
    Then I sleep for 7 seconds
    Then I wait "Beyaz Esya Text;Bulasik Makinesi;Buzdolabi;Derin Dondurucu;Firin;" elements
    Then I wait "Kurutma Makinesi;Kurutmali Camasir Makinesi;Su Sebili;Camasir Makinesi" elements
    And I wait "Sol Panel Header Text" element
    Then I sleep for 5 seconds


    Examples:
      | username             | password    | url                                        |
      | bekos1test@gmail.com | Albayrak.41 | https://akamai-s1-astra-stage.beko.com.tr/ |

