Feature: Ana sayfa kontrolleri

  @smoke @header @hijyen
  Scenario Outline: Test08- Hijyen kategorisinde olmasi gereken basliklarin kontrolu
    When I see "HomePage" page
    Then I go to url:"<url>"
    Then I wait "uyelik button" element
    When I see "HomePage" page
    Then I wait until element to be clickable and click to "urunler button" element
    When I see "HomePage" page
    And I wait until element to be clickable and click to "Hijyen Aksesuar" element
    When I see "Hijyen" page
    Then I wait "Hijyen Text;Aksesuarlar;Aktif Hijyen;Temizlik ve Bakim Urunleri" elements
    And I wait "Sol Panel Header Text" element
    Then I sleep for 1 seconds


    Examples:
      | url                                        |
      | https://akamai-s1-astra-stage.beko.com.tr/ |

