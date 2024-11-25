Feature: Kullanici islemleri


  @userAdres25 @smoke @regresyon
  Scenario Outline: Test06- Ad Soyad Güncelleme

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
    And I scroll until find "giris yap" element with action
    Then I wait until element to be clickable and click to "giris yap" element
    Then I sleep for 10 seconds
    When I see "HomePage" page
    Then I wait until element to be clickable and click to "hesabim button" element
    Then I sleep for 10 seconds
    When I see "HesabimPage" page
    Then I wait "uyelik bilgileri;Adiniz;Soyadiniz;Cinsiyet;Dogum Tarihi;TC no;Telefon Numarasi;Email" elements
    Then I clear "Adiniz" textbox
    Then I send key to "Adiniz" element random "name"
    And I clear "Soyadiniz" textbox
    Then I send key to "Soyadiniz" element random "surname"
    Then I scroll down until find "kisiler bilgiler onay" element
    Then I wait until element to be clickable and click to "Kaydet Button" element
    Then I sleep for 3 seconds




    Examples:
      | username             | password    | url                                        |
      | beko.s1test@gmail.com | Albayrak.41 | https://akamai-s1-astra-stage.beko.com.tr/ |


  @updateC @smokeC @regresyon @canli
  Scenario Outline: Test106- Canli Ad Soyad Güncelleme

    When I see "HomePage" page
    Then I go to url:"<url>"
    Then I wait "uyelik button" element
    Then I sleep for 4 seconds
    Then I wait until element to be clickable and click to "Cerezleri kabul et" element
    Then I wait until element to be clickable and click to "uyelik button" element
    When I see "LoginPage" page
    Then I wait "username" element
    Then I wait "password" element
    Then I send key to "username" element text:"<username>"
    Then I send key to "password" element text:"<password>"
    And I scroll until find "giris yap" element with action
    Then I wait until element to be clickable and click to "giris yap" element
    Then I sleep for 10 seconds
    When I see "HomePage" page
    Then I wait until element to be clickable and click to "Hesabim button" element
    Then I sleep for 10 seconds
    When I see "HesabimPage" page
    Then I wait "uyelik bilgileri;Adiniz;Soyadiniz;Cinsiyet;Dogum Tarihi;TC no;Telefon Numarasi;Email" elements
    Then I clear "Adiniz" textbox
    Then I send key to "Adiniz" element random "name"
    And I clear "Soyadiniz" textbox
    Then I send key to "Soyadiniz" element random "surname"
    Then I scroll down until find "kisiler bilgiler onay" element
    Then I wait until element to be clickable and click to "Kaydet Button" element
    Then I sleep for 3 seconds




    Examples:
      | username              | password    | url                      |
      | bekos1.test@gmail.com | Albayrak.41 | https://www.beko.com.tr/ |