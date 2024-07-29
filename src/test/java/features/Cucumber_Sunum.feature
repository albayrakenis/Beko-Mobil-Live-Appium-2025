Feature: Kullanici islemleri

  @user @smoke @sunum
  Scenario Outline: Test01- Basarili Giris
    Then I go to url:"<url>"
    When I see "HomePage" page
    Then I wait "uyelik button" element
    Then I sleep for 5 seconds
    Then I wait until element to be clickable and click to "uyelik button" element
    When I see "LoginPage" page
    Then I wait "username" element
    Then I wait "password" element
    Then I send key to "username" element text:"<username>"
    Then I send key to "password" element text:"<password>"
    Then I wait until element to be clickable and click to "giris yap" element
    When I see "HomePage" page
    Then I sleep for 3 seconds
    And I wait "urunler button;Kampanyalar" elements
    Then I check "urunler button" element text is equal "Ürünler"
    Then I check "Kampanyalar" element text is equal "Kampanyalar"



    Examples:
      | username             | password    | url                                                                                       |
      | bekos1test@gmail.com | Albayrak.41 | https://akamai-s1-astra-stage.beko.com.tr/                                                |
      | lefyazardu@gufum.com | Albayrak.41 | https://akamai-s1-astra-stage.arcelik.com.tr/                                             |
      | testititre@gufum.com | Albayrak.41 | https://grundigtr-astra.c1m0wu3z2z-arcelikas1-s1-public.model-t.cc.commerce.ondemand.com/ |
