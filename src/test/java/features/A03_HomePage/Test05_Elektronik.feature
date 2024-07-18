Feature: Ana sayfa kontrolleri

  @smoke @header @elektronik
  Scenario Outline: Test05- Elektronik kategorisinde olmasi gereken basliklarin kontrolu
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
    And I wait until element to be clickable and click to "Elektronik" element
    When I see "Elektronik" page
    Then I sleep for 7 seconds
    Then I wait "Elekronik Text;Bilgisayar;Cep Telefonu;Cep Telefonu Aksesuarlari;Giyilebilir Teknoloji;Hobi Oyunlari" elements
    Then I wait "Ses ve Goruntu Sistemleri;Spor ve Outdoor;Telefon;Odeme Sistemleri;" elements
    And I wait "Sol Panel Header Text" element
    Then I sleep for 5 seconds


    Examples:
      | url                                        |
      | https://akamai-s1-astra-stage.beko.com.tr/ |

