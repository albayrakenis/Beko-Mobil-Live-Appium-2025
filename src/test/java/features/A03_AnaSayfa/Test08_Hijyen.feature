Feature: Ana sayfa kontrolleri

  @smoke @header @hijyen
  Scenario Outline: Test08- Hijyen kategorisinde olmasi gereken basliklarin kontrolu
    When I see "HomePage" page
    Then I go to "<url>" with configuration
    Then I wait "uyelik button" element
    When I see "HomePage" page
    Then I wait until element to be clickable and click to "urunler button" element
    When I see "HomePage" page
    And I wait until element to be clickable and click to "Hijyen Aksesuar" element
    When I see "Hijyen" page
    Then I wait "Hijyen Text;Aksesuarlar;Aktif Hijyen" elements
    And I wait "Sol Panel Header Text" element
    Then I sleep for 1 seconds


    Examples:
      | url |
      | url |

