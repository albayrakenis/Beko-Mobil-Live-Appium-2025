Feature: Satin Alma Islemleri

  @user2 @smoke @kkOrder @Favorites
  Scenario Outline: Test012- Login favori ekleme
    When I see "HomePage" page
    Then I go to url:"<url>"
    Then I wait "uyelik button" element
    Then I wait until element to be clickable and click to "uyelik button" element
    When I see "LoginPage" page
    Then I wait "username" element
    Then I wait "password" element
    Then I send key to "username" element text:"<username>"
    Then I send key to "password" element text:"<password>"
    Then I wait until element to be clickable and click to "giris yap" element
    And I sleep for 8 seconds
    When I see "HomePage" page
    Then I wait "search box" element
    Then I wait until element to be clickable and click to "search box" element
    Then I send key to "search box text" element text:"7967121600"
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
    
    Then I check "Favoriye eklenen urun" element text is equal "SAMSUNG Galaxy S20 FE 128GB Mor"
    And I scroll until find "Sepeti bosalt button" element with action
    Then I wait "Sepeti bosalt button" element
    And I wait until element to be clickable and click to "Sepeti bosalt button" element
    And I sleep for 5 seconds


    Examples:
      | username             | password    |url|
      | bekos1test@gmail.com | Albayrak.41 | https://akamai-s1-astra-stage.beko.com.tr/  |

