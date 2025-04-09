Feature: Ana sayfa kontrolleri

  @smoke @header @isitmaSogutma
  Scenario Outline: Test06- Isıtma-Sogutma kategorisinde olmasi gereken basliklarin kontrolu
    When I see "HomePage" page
    Then I go to "<url>" with configuration
    Then I wait "uyelik button" element
    When I see "HomePage" page
    Then I wait until element to be clickable and click to "Cerezleri kabul et" element
    Then I wait until element to be clickable and click to "urunler button" element
    When I see "HomePage" page
    And I wait until element to be clickable and click to "isitma sogutma" element
    When I see "IsitmaSogutma" page
    Then I wait "Isitma Sogutma Text;Elektrikli Isitici;Hava Sogutucu;Ic Hava Kalitesi;Klima;Kombi" elements
    Then I wait "Termosifon;Vantilator" elements
    And I wait "Sol Panel Header Text" element
    Then I sleep for 1 seconds


    Examples:
      | url |
      | url |

