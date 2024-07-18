Feature: Ana sayfa kontrolleri

  @smoke @header @kea
  Scenario Outline: Test07- KEA kategorisinde olmasi gereken basliklarin kontrolu
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
    And I wait until element to be clickable and click to "KEA" element
    When I see "KEA" page
    Then I sleep for 7 seconds
    Then I wait "KEA Text;Icecek Hazirlama;Karistirici Dograyici;Pisirici;Supurge" elements
    Then I wait "Kahve Makinesi Aksesuarlari;Yogurt Makinesi;Utu" elements
    And I wait "Sol Panel Header Text" element
    Then I sleep for 5 seconds


    Examples:
      | url                                        |
      | https://akamai-s1-astra-stage.beko.com.tr/ |

