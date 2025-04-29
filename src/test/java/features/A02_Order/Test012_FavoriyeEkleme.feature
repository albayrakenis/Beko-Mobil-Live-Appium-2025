Feature: Satin Alma Islemleri

  @user2 @smoke @kkOrder @Favorites2 @order
  Scenario Outline: Test12- Login favori ekleme
    When I see "HomePage" page
    When I go to "<url>" with configuration
    Then I wait "uyelik button" element
    Then I wait until element to be clickable and click to "Cerezleri kabul et" element
    Then I wait until element to be clickable and click to "uyelik button" element
    When I see "LoginPage" page
    Then I wait "username" element
    Then I wait "password" element
    Then I login with "<username>" and "<password>"
    And I scroll until find "giris yap" element with action
    Then I wait until element to be clickable and click to "giris yap" element
    And I sleep for 8 seconds
    When I see "HomePage" page
    Then I wait "search box" element
    Then I wait until element to be clickable and click to "search box" element
    Then I send key to "search box text" element text:"<urun kodu>"
    Then I wait until element to be clickable and click to "search icon" element
    Then I sleep for 3 seconds
    When I see "PLP" page
    Then I sleep for 1 seconds
    And I scroll until find "incele button" element with action
    Then I wait until element to be clickable and click to "incele button" element
    When I see "PDP" page
    Then I sleep for 5 seconds
    And I wait "favorilere ekle button" element
    Then I wait until element to be clickable and click to "favorilere ekle button" element
    When I see "PDP" page
    Then I wait until element to be clickable and click to "Hesabim button" element
    When I see "HesabimPage" page
    Then I wait until element to be clickable and click to "favorilerim" element
    And I sleep for 5 seconds
    Then I wait "Favoriye eklenen urun" element
    Then I check "Favoriye eklenen urun" element text is equal "<urun adi>"
    And I scroll until find "<urun>" element with action
    Then I wait "<urun>" element
    And I sleep for 3 seconds
    And I wait until element to be clickable and click to "<urun>" element
    And I sleep for 5 seconds


    Examples:
      | username   | password | url | urun                              | urun kodu  | urun adi                                 |
      | kullanici1 | sifre    | url | Kahve makinesini favorilerden sil | 8914761200 | CEG 7304 X CaffeExperto® Tam Otomatik    |
      | kullanici1 | sifre    | url | ipad favorilerden sil             | 9242291600 | iPad 10.Nesil WiFi 256GB Gümüş MCMD4TU/A |
      | kullanici1 | sifre    | url | Telefon favorilerden sil          | 9242291600 | iPhone 14 256GB (Product)RED             |

