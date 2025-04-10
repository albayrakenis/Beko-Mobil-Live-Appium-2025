Feature: Satin Alma Islemleri

  @smoke  @order @ckk
  Scenario Outline: Test14- Coklu Kredi Karti ile Satın Alma
    When I see "HomePage" page
    When I go to "<url>" with configuration
    Then I wait "uyelik button" element
    Then I sleep for 9 seconds
    Then I wait until element to be clickable and click to "Cerezleri kabul et" element
    Then I wait until element to be clickable and click to "uyelik button" element
    When I see "LoginPage" page
    Then I wait "username" element
    Then I wait "password" element
    Then I login with "<username>" and "<password>"
    And I scroll until find "giris yap" element with action
    Then I wait until element to be clickable and click to "giris yap" element
    Then I sleep for 7 seconds
    When I see "HomePage" page
    And I wait until element to be clickable and click to "sepet icon" element
    Then I sleep for 2 seconds
    And I scroll until find "sepeti bosalt" element with action
    And I wait until element to be clickable and click to "sepeti bosalt" element if element exist:4
    Then I sleep for 3 seconds
    Then I wait "search box" element
    Then I wait until element to be clickable and click to "search box" element
    Then I send key to "search box text" element text:"<urunKodu>"
    Then I wait until element to be clickable and click to "search icon" element
    Then I sleep for 3 seconds
    When I see "PLP" page
    Then I sleep for 1 seconds
    And I scroll until find "incele button" element with action
    Then I wait until element to be clickable and click to "incele button" element
    When I see "PDP" page
    Then I wait until element to be clickable and click to "Sepete At Button" element
    Then I wait until element to be clickable and click to "Sepete Git Button" element
    When I see "CartPage" page
    And I scroll until find "Sepeti Onayla Button" element with action
    Then I wait until element to be clickable and click to "Sepeti Onayla Button" element
    Then I sleep for 5 seconds
    And I scroll until find "Coklu kredi karti" element with action
    And I wait "Coklu kredi karti" element
    And I scroll until find "Coklu kredi karti" element with action
    Then I wait until element to be clickable and click to "Coklu kredi karti" element
    And I wait "ckk ilk tutar" element
    Then I send key to "ckk ilk tutar" element text:"500"
    Then I send key to "ckk ilk kredi karti" element text:"9792060000000007"
    #Then I send key to "ckk ilk kredi karti" element text:"4282209004348015"
    And I scroll until find "ckk kart cvv" element with action
    Then I send key to "ckk kart sahibi" element text:"Enis Albayrak"
    Then I send key to "ckk kart tarih" element text:"1240"
    Then I send key to "ckk kart cvv" element text:"000"
    When I see "CartPage" page
    And I scroll until find "ckk kart onayla" element with action
    Then I wait until element to be clickable and click to "ckk kart onayla" element





    Examples:

      | username             | password    | url                                        | urunKodu   |
      #| gurtobomlo@gufum.com | Albayrak.41 | https://akamai-s1-astra-stage.beko.com.tr/ | 8818541200 |
      | kullanici1 | sifre | url | 8914111200 |

