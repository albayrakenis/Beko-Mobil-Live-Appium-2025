Feature: Satin Alma Islemleri

  @user2 @smoke @kkOrder @guestFavorites
  Scenario Outline: Test011- Guest favori ekleme
    When I see "HomePage" page
    Then I go to url:"<url>"
    Then I wait "uyelik button" element
    When I see "HomePage" page
    Then I wait "search box" element
    Then I wait until element to be clickable and click to "search box" element
    Then I send key to "search box text" element text:"7285520282"
    Then I wait until element to be clickable and click to "search icon" element
    Then I sleep for 3 seconds
    When I see "PLP" page
    Then I sleep for 1 seconds
    And I scroll until find "incele button" element with action
    Then I wait until element to be clickable and click to "incele button" element
    When I see "PDP" page
    And I wait "Ek Garanti Button" element
    Then I sleep for 5 seconds
    And I wait "favorilere ekle button" element
    Then I wait until element to be clickable and click to "favorilere ekle button" element
    When I see "LoginPage" page
    Then I wait "username" element
    Then I wait "password" element
    Then I send key to "username" element text:"<username>"
    Then I send key to "password" element text:"<password>"
    Then I wait until element to be clickable and click to "giris yap favori" element
    And I sleep for 8 seconds
    When I see "PDP" page
    Then I wait until element to be clickable and click to "Hesabim button" element
    When I see "HesabimPage" page
    Then I wait until element to be clickable and click to "favorilerim" element
    And I sleep for 5 seconds
    Then I wait "Favoriye eklenen buzdolabi" element
    
    Then I check "Favoriye eklenen buzdolabi" element text is equal "191640 EI"
    And I scroll until find "Sepeti bosalt button" element with action
    Then I wait "Sepeti bosalt button" element
    And I sleep for 5 seconds

#    Then I check "Favorilere Eklendi Text" element text is equal "Favorilerine Eklendi"


    Examples:
      | username             | password    |url|
      | bekos1test@gmail.com | Albayrak.41 | https://akamai-s1-astra-stage.beko.com.tr/  |

