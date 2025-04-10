Feature: Ana sayfa kontrolleri

  @smoke @header @televizyon
  Scenario Outline: Test04- Televizyon kategorisinde olmasi gereken basliklarin kontrolu
    When I see "HomePage" page
    Then I go to "<url>" with configuration
    Then I wait "uyelik button" element
    When I see "HomePage" page
    Then I wait until element to be clickable and click to "Cerezleri kabul et" element
    Then I wait until element to be clickable and click to "urunler button" element
    When I see "HomePage" page
    And I wait until element to be clickable and click to "Televizyon" element
    When I see "Televizyon" page
    Then I wait "Televizyon Text;Smart TV;Oled TV;QLED;Google TV;Dev Ekran TV;" elements
    Then I wait "Full HD TV;4K TV;Led TV;Mutfak Televizyonu;Grundig TV;Philips TV;TCL TV;Hotel TV;Ekran Boyutuna Gore TVler;" elements
    And I wait "Sol Panel Header Text" element


    Examples:
      | url |
      | url |

