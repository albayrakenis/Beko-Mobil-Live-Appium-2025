Feature: Satin Alma Islemleri

  @user2 @smoke @kkOrder @guestFavorites @Favorites
  Scenario Outline: Test11- Guest favori ekleme
    When I see "HomePage" page
    Then I go to url:"<url>"
    Then I wait "uyelik button" element
    When I see "HomePage" page
    Then I wait "search box" element
    Then I wait until element to be clickable and click to "search box" element
    Then I send key to "search box text" element text:"<urunKodu>"
    Then I wait until element to be clickable and click to "search icon" element
    When I see "PLP" page
    Then I sleep for 1 seconds
    And I scroll until find "incele button" element with action
    Then I wait until element to be clickable and click to "incele button" element
    When I see "PDP" page
    And I wait "favorilere ekle button" element
    Then I wait until element to be clickable and click to "favorilere ekle button" element
    When I see "LoginPage" page
    Then I wait "username" element
    Then I wait "password" element
    Then I send key to "username" element text:"<username>"
    Then I send key to "password" element text:"<password>"
    Then I wait until element to be clickable and click to "giris yap favori" element
    And I sleep for 5 seconds
    When I see "PDP" page
    Then I wait until element to be clickable and click to "Hesabim button" element
    When I see "HesabimPage" page
    Then I wait until element to be clickable and click to "favorilerim" element
#    And I sleep for 5 seconds
    Then I wait "Favoriye eklenen urun" element
    Then I check "Favoriye eklenen urun" element text is equal "<urunAdi>"
    And I scroll until find "Sepeti bosalt button" element with action
    Then I wait "Sepeti bosalt button" element
    And I wait until element to be clickable and click to "Sepeti bosalt button" element
    And I sleep for 5 seconds



    Examples:
      | username             | password    | url                                        | urunKodu   | urunAdi                     |
      | bekos1test@gmail.com | Albayrak.41 | https://akamai-s1-astra-stage.beko.com.tr/ | 7285520282 | 191640 EI                   |
      | bekos1test@gmail.com | Albayrak.41 | https://akamai-s1-astra-stage.beko.com.tr/ | 7188210290 | D 81 HP                     |
      | bekos1test@gmail.com | Albayrak.41 | https://akamai-s1-astra-stage.beko.com.tr/ | 9220171600 | KARCHER SC 2 DELUXE EasyFix |

