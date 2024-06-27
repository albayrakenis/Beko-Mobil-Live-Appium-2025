Feature: Users Suits

  @user @smoke
  Scenario Outline: Invalid password
    When I see "HomePage" page
    Then I go to url:"<url>"
    Then I wait "uyelik button" element
    Then I sleep for 5 seconds
    Then I wait until element to be clickable and click to "uyelik button" element
    When I see "LoginPage" page
    Then I wait "username" element
    Then I wait "password" element
    Then I send key to "username" element text:"<username>"
    Then I send key to "password" element text:"<passwordWrong>"
#    Then I scroll down until find "giris yap" element
    Then I wait until element to be clickable and click to "giris yap" element
    Then I check "login hata mesaji" element text is equal "E-posta adresiniz ya da şifreniz yanlış"
    Then I sleep for 5 seconds

    Examples:
      | username             | passwordWrong | url                                                                                      |
      | bekos1test@gmail.com | Albayra41     | https://akamai-s1-astra-stage.beko.com.tr/                                               |
#      | bekos1test@gmail.com | Albayrak.41   | https://akamai-s1-astra-stage.arcelik.com.tr/                                            |
#      | bekos1test@gmail.com | Albayrak.41   | https://grundigtr-astra.c1m0wu3z2z-arcelikas1-s1-public.model-t.cc.commerce.ondemand.com/ |
