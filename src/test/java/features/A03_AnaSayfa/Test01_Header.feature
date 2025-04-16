Feature: Ana sayfa kontrolleri



  @smoke @headerC @basliklarC @regresyon
  Scenario Outline: Test101- Canli Headerda olmasi gereken basliklarin kontrolu

    When I see "HomePage" page
    Then I go to "<urlCanli>" with configuration
    When I see "HomePage" page
    Then I wait "uyelik button" element
    Then I wait until element to be clickable and click to "Cerezleri kabul et" element
    Then I wait until element to be clickable and click to "urunler button" element
    Then I wait "Beyaz esya;Ankastre;Televizyon;Elektronik;isitma sogutma ve enerji" elements
    Then I sleep for 2 seconds
    Then I wait "KEA;Hijyen Aksesuar;Su aritma;Enerji Cozumleri;Temizlik ve bakim;" elements
    Then I wait "Evcil hayvan urunleri;Umutkent koleksiyonu" elements



    Examples:
      | urlCanli |
      | url |

