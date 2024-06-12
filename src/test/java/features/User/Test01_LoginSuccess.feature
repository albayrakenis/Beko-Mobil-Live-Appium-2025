
Feature: Users Suits

  @user
  Scenario Outline: Success Login Test
    When I see "HomePage" page
    Then I go to url:"https://akamai-s1-astra-stage.beko.com.tr/"
    Then I wait "uyelik button" element
    Then I sleep for 5 seconds
    Then I wait until element to be clickable and click to "uyelik button" element
    When I see "LoginPage" page
    Then I wait "username" element
    Then I wait "password" element
    Then I send key to "username" element text:"<username>"
    Then I send key to "password" element text:"<password>"
#    Then I scroll down until find "giris yap" element
    Then I wait until element to be clickable and click to "giris yap" element
    Then I sleep for 5 seconds

    Examples:
      | username             | password    |
      | bekos1test@gmail.com | Albayrak.41 |
#
#  @user
#  Scenario Outline : Wrong username
#    When I see "HomePage" page
#    Then I go to url:"https://akamai-s1-astra-stage.beko.com.tr/"
#    Then I wait "uyelik button" element
#    Then I sleep for 5 seconds
#    Then I wait until element to be clickable and click to "uyelik button" element
#    When I see "LoginPage" page
#    Then I wait "username" element
#    Then I wait "password" element
#    Then I send key to "username" element text:"<usernameWrong>"
#    Then I send key to "password" element text:"<password>"
#    Then I wait until element to be clickable and click to "giris yap" element
#    Then I check "login hata mesaji" element text is equal "E-posta adresiniz ya da şifreniz yanlış"


#    Examples:
#      | usernameWrong      | password    |
#      | bekos1te@gmail.com | Albayrak.41 |

