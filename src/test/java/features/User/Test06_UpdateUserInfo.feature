Feature: Users Suits

  @userAdres25
  Scenario Outline: Add Adress

    When I see "HomePage" page
    Then I go to url:"<url>"
    Then I wait "uyelik button" element
    Then I sleep for 1 seconds
    Then I wait until element to be clickable and click to "uyelik button" element
    When I see "LoginPage" page
    Then I wait "username" element
    Then I wait "password" element
    Then I send key to "username" element text:"<username>"
    Then I send key to "password" element text:"<password>"
    Then I wait until element to be clickable and click to "giris yap" element
    Then I sleep for 5 seconds
    When I see "HomePage" page
    Then I wait until element to be clickable and click to "hesabim button" element
    Then I sleep for 1 seconds
    When I see "HesabimPage" page
#    Then I wait "uyelik bilgileri;Adiniz;Soyadiniz;Cinsiyet;Dogum Tarihi;TC no;Telefon Numarasi;Email" elements
    Then I clear "Adiniz" textbox
    Then I sleep for 2 seconds
    Then I send key to "Adiniz" element random name
    Then I sleep for 3 seconds
    Then I scroll down until find "Kaydet Button" element
    Then I wait until element to be clickable and click to "Kaydet Button" element
    Then I sleep for 3 seconds




    Examples:
      | username             | password    | url                                        |
      | bekos1test@gmail.com | Albayrak.41 | https://akamai-s1-astra-stage.beko.com.tr/ |