
Feature: Ana sayfa kontrolleri

 @smoke @header
  Scenario Outline: Test01- Headerda olmasi gereken basliklarin kontrolu
    When I see "HomePage" page
    Then I go to url:"<url>"
    Then I wait "uyelik button" element
    Then I sleep for 3 seconds
    When I see "HomePage" page
    Then I wait until element to be clickable and click to "urunler button" element
    Then I sleep for 2 seconds
    When I see "HomePage" page
   Then I wait "Beyaz esya;Ankastre;Televizyon;Elektronik;isitma sogutma;" elements
   Then I wait "KEA;Hijyen Aksesuar;Su aritma;Markalar;" elements



    Examples:
      | username             | password    |url|
      | bekos1test@gmail.com | Albayrak.41 | https://akamai-s1-astra-stage.beko.com.tr/  |

