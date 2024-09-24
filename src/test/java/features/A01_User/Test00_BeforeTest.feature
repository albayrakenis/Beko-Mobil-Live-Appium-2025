
Feature: Kullanici islemleri

  @user2 @smoke @adresSil @regresyon
  Scenario Outline: Test00- Onceki Adresleri Silme
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
    Then I wait until element to be clickable and click to "hesabim button" element
    Then I sleep for 2 seconds
    When I see "HesabimPage" page
    And  I delete saved adress


    Examples:
      | username             | password    |url|
      | gurtobomlo@gufum.com | Albayrak.41 | https://akamai-s1-astra-stage.beko.com.tr/  |
      | bekos1test@gmail.com | Albayrak.41 | https://akamai-s1-astra-stage.beko.com.tr/  |


  @user2C @canli @adresSilC @regresyon
  Scenario Outline: Test100- Canli Onceki Adresleri Silme
    When I see "HomePage" page
    Then I go to url:"<url>"
    Then I wait "uyelik button" element
    Then I sleep for 3 seconds
    Then I wait until element to be clickable and click to "Cerezleri kabul et" element
    Then I wait until element to be clickable and click to "uyelik button" element
    When I see "LoginPage" page
    Then I wait "username" element
    Then I wait "password" element
    Then I send key to "username" element text:"<username>"
    Then I send key to "password" element text:"<password>"
    Then I wait until element to be clickable and click to "giris yap" element
    Then I sleep for 7 seconds
    When I see "HomePage" page
    Then I wait until element to be clickable and click to "hesabim button" element
    Then I sleep for 2 seconds
    When I see "HesabimPage" page
    And  I delete saved adress


    Examples:
      | username             | password    |url|
      | bekos1.test@gmail.com | Albayrak.41  | https://www.beko.com.tr/ |

