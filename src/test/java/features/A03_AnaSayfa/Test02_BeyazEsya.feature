Feature: Ana sayfa kontrolleri

  @smoke @header @beyazesya
  Scenario Outline: Test02- Beyaz Esya kategorisinde olmasi gereken basliklarin kontrolu
    When I see "HomePage" page
    Then I go to "<url>" with configuration
    Then I wait "uyelik button" element
    When I see "HomePage" page
    Then I wait until element to be clickable and click to "Cerezleri kabul et" element
    Then I wait until element to be clickable and click to "urunler button" element
    When I see "HomePage" page
    And I scroll until find "Ankastre" element with action
    Then I wait "Beyaz esya;Ankastre;Televizyon;Elektronik;isitma sogutma;" elements
    Then I wait "KEA;Hijyen Aksesuar;Su aritma;" elements
    And I wait until element to be clickable and click to "Beyaz esya" element
    When I see "BeyazEsya" page
    Then I wait "Beyaz Esya Text;Bulasik Makinesi;Buzdolabi;Derin Dondurucu;Firin;" elements
    Then I wait "Kurutma Makinesi;Kurutmali Camasir Makinesi;Set Ustu Ocak;Su Sebili;Su Sebili;Camasir Makinesi" elements
    And I wait "Sol Panel Header Text" element
    Then I sleep for 1 seconds


    Examples:
      | url |
      | url |

