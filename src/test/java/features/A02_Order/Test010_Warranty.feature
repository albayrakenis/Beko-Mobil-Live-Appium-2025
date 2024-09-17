Feature: Satin Alma Islemleri

  @user2 @smoke @kkOrder @warranty
  Scenario Outline: Test010- Ek Garanti
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
    Then I wait until element to be clickable and click to "Ek Garanti Button" element
    And I wait "2 yıllık ek garanti pdp;4 yıllık ek garanti pdp;ek garanti popup kapatma button" elements
    Then I wait until element to be clickable and click to "ek garanti popup kapatma button" element
    Then I wait until element to be clickable and click to "Sepete At Button" element
    And I wait "4 yillik ek garanti popup;2 yillik ek garanti popup;Urun sepete eklendi text" elements
    Then I wait until element to be clickable and click to "Sepete Git Button" element
    When I see "CartPage" page
    And I scroll until find "sepet ek garanti button" element with action
    Then I wait until element to be clickable and click to "sepet ek garanti button" element
    Then I sleep for 3 seconds
    And I wait "sepet sayfasi 4 yillik ek garanti;sepet sayfasi 2 yillik ek garanti" elements
    Then I wait until element to be clickable and click to "4 yillik ek garanti seç button" element
    Then I sleep for 3 seconds
    And I wait "Sepete eklenmiş 4 yillik ek garanti text" element
    And I wait "4 yillik ek garanti sil button" element
    Then I wait until element to be clickable and click to "4 yillik ek garanti sil button" element
    Then I sleep for 3 seconds
    And I wait "Ek Garanti Sepet Button" element
    Then I wait until element to be clickable and click to "Ek Garanti Sepet Button" element
    Then I wait until element to be clickable and click to "2 yillik ek garanti seç button" element
    Then I sleep for 3 seconds
    And I wait "Sepete eklenmiş 2 yillik ek garanti text" element
    And I wait "2 yillik ek garanti sil button" element
    Then I wait until element to be clickable and click to "2 yillik ek garanti sil button" element

    Examples:
      | username             | password    |url|
      | bekos1test@gmail.com | Albayrak.41 | https://akamai-s1-astra-stage.beko.com.tr/  |

