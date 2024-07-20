Feature: Satin Alma Islemleri

  @smoke  @order @pdpAddBasket
  Scenario Outline: Test06- PDP den Sepete Urun Ekleme
    When I see "HomePage" page
    Then I go to url:"<url>"
    And I sleep for 5 seconds
    Then I wait "uyelik button" element
    Then I sleep for 3 seconds
    When I see "HomePage" page
    Then I wait until element to be clickable and click to "urunler button" element
    Then I sleep for 2 seconds
    When I see "HomePage" page
    And I wait until element to be clickable and click to "Camasir Makinesi Button" element
    When I see "PDP" page
    And I wait until element to be clickable and click to "Filtrele Button" element
    And I wait until element to be clickable and click to "Stok Durumu" element
    And I wait until element to be clickable and click to "Var Button" element
    And I wait until element to be clickable and click to "Uygula Button" element
    And I scroll until find "Pdp ilk urun" element with action
    And I wait until element to be clickable and click to "Pdp ilk urun" element
    And I wait until element to be clickable and click to "Sepete At Button" element
    And I wait "Urun sepete eklendi text" element
    And I wait until element to be clickable and click to "Sepete Git Button" element
    When I see "CartPage" page
    And I wait "Sepet Title" element
    And I wait "Sepete Eklenen Urun Text" element
    And I wait "Sepeti Bosalt" element
    Then I sleep for 10 seconds





    Examples:
      | username             | password    | url                                        |
      | bekos1test@gmail.com | Albayrak.41 | https://akamai-s1-astra-stage.beko.com.tr/ |

