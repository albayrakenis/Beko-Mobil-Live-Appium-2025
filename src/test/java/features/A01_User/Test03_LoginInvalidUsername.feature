Feature: Kullanici islemleri

  @user @smoke @yanlisSifre @regresyon
  Scenario Outline:Test03- Yanlis Kullanici Adi ile Giriş Denemesi
    When I see "HomePage" page
    Then I go to url:"https://akamai-s1-astra-stage.beko.com.tr/"
    Then I wait "uyelik button" element
    Then I sleep for 5 seconds
    Then I wait until element to be clickable and click to "uyelik button" element
    When I see "LoginPage" page
    Then I wait "username" element
    Then I wait "password" element
    Then I send key to "username" element text:"<usernameWrong>"
    Then I send key to "password" element text:"<password>"
    And I scroll until find "giris yap" element with action
    Then I wait until element to be clickable and click to "giris yap" element
    Then I check "login hata mesaji" element text is equal "E-posta adresiniz ya da şifreniz yanlış"
    Then I sleep for 5 seconds

    Examples:
      | usernameWrong        | password  |
      | beko.s1test@gmail.com | Albayra41 |


  @userC @yanlissifre @canli @regresyon
  Scenario Outline: Test103- Canli Yanlis Kullanici Adi ile Giriş Denemesi
    Then I go to url:"<url>"
    When I see "HomePage" page
    Then I wait "uyelik button" element
    Then I sleep for 5 seconds
    Then I wait until element to be clickable and click to "Cerezleri kabul et" element
    Then I wait until element to be clickable and click to "uyelik button" element
    When I see "LoginPage" page
    Then I wait "username" element
    Then I wait "password" element
    Then I send key to "username" element text:"<username>"
    Then I send key to "password" element text:"<password>"
    And I scroll until find "giris yap" element with action
    Then I wait until element to be clickable and click to "giris yap" element
    Then I check "login hata mesaji" element text is equal "E-posta adresiniz ya da şifreniz yanlış"
    And I sleep for 5 seconds


    Examples:
      | username             | password | url                      |

      | abcd@gmail.com | Albayrak.41  | https://www.beko.com.tr/ |


