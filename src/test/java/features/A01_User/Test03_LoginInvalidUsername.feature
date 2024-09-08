Feature: Kullanici islemleri

  @user @smoke @yanlisSifre
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
#    Then I scroll down until find "giris yap" element
    Then I wait until element to be clickable and click to "giris yap" element
    Then I check "login hata mesaji" element text is equal "E-posta adresiniz ya da şifreniz yanlış"
    Then I sleep for 5 seconds

    Examples:
      | usernameWrong        | password  |
      | bekos1test@gmail.com | Albayra41 |


