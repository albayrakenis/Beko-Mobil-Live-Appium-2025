Feature: Satin Alma Islemleri

  @user2 @smoke @collect
  Scenario Outline: Test004- Click and Collect ile Satın Alma
    When I see "HomePage" page
    Then I go to url:"<url>"
    Then I wait "uyelik button" element
    Then I sleep for 3 seconds
    Then I wait until element to be clickable and click to "uyelik button" element
    When I see "LoginPage" page
    Then I wait "username" element
    Then I wait "password" element
    Then I send key to "username" element text:"<username>"
    Then I send key to "password" element text:"<password>"
    Then I wait until element to be clickable and click to "giris yap" element
    Then I sleep for 7 seconds
    When I see "HomePage" page
    Then I wait "search box" element
    Then I wait until element to be clickable and click to "search box" element
    Then I send key to "search box text" element text:"8912281200"
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
    Then I sleep for 7 seconds
    Then I wait until element to be clickable and click to "Magazadan Teslim Al" element
    Then I wait until element to be clickable and click to "Seciniz" element


    Then I wait "Teslim Alinabilecek Magazalar" element
    Then I sleep for 3 seconds
#    Then I wait until element to be clickable and click to "Sehir Secme" element
    Then I choose city "İSTANBUL" from list for click and collect
    Then I sleep for 3 seconds
    Then I choose town "ATAŞEHİR" from list for click and collect
    Then I sleep for 3 seconds
    Then I wait until element to be clickable and click to "Magaza Ara" element
    Then I wait until element to be clickable and click to "Sec" element



    Examples:
      | username             | password    |url|
      | bekos1test@gmail.com | Albayrak.41 | https://akamai-s1-astra-stage.beko.com.tr/  |

