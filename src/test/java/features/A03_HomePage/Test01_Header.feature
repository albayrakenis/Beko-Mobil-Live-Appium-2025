Feature: Ana sayfa kontrolleri

  @smoke @header @basliklar
  Scenario Outline: Test01- Headerda olmasi gereken basliklarin kontrolu

    When I see "HomePage" page
    Then I go to url:"<url>"
    When I see "HomePage" page
    Then I wait "uyelik button" element
    Then I wait until element to be clickable and click to "urunler button" element
    Then I wait "Beyaz esya;Ankastre;Televizyon;Elektronik;isitma sogutma;" elements
    Then I wait "KEA;Hijyen Aksesuar;Su aritma;Markalar;" elements



    Examples:
      | url                                        |
      | https://akamai-s1-astra-stage.beko.com.tr/ |

