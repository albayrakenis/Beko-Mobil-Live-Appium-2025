Feature: Kullanici islemleri

  @user @smoke @yanlissifre @regresyon
  Scenario Outline: Test02- Yanlis Sifre ile Giris Denemesi
    When I see "HomePage" page
    Then I go to url:"<url>"
    Then I wait "uyelik button" element
    Then I sleep for 5 seconds
    And I wait until element to be clickable and click to "Cerezleri kabul et" element if element exist:1
    Then I wait until element to be clickable and click to "uyelik button" element
    When I see "LoginPage" page
    Then I wait "username" element
    Then I wait "password" element
    Then I send key to "username" element text:"<username>"
    Then I send key to "password" element text:"<passwordWrong>"
    Then I wait until element to be clickable and click to "giris yap" element
    Then I check "login hata mesaji" element text is equal "E-posta adresiniz ya da şifreniz yanlış"
    Then I sleep for 5 seconds

    Examples:
      | username              | passwordWrong | url                                        |
      | bekos1.test@gmail.com | abcd123       | https://www.beko.com.tr/                   |
      | bekos1test@gmail.com  | Albayra41     | https://akamai-s1-astra-stage.beko.com.tr/ |


  @userC  @yanlissifre @canli @regresyon
  Scenario Outline: Test102- Canli Yanlis Sifre ile Giris Denemesi
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
    Then I wait until element to be clickable and click to "giris yap" element
    Then I check "login hata mesaji" element text is equal "E-posta adresiniz ya da şifreniz yanlış"
    And I sleep for 5 seconds


    Examples:
      | username              | password | url                      |

      | bekos1.test@gmail.com | abcd123  | https://www.beko.com.tr/ |

