Feature: Kullanici islemleri


  @userAdres @smoke
  Scenario Outline:Test04-  Adres Ekleme

    When I see "HomePage" page
    Then I go to url:"<url>"
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
    Then I sleep for 10 seconds
    When I see "HomePage" page
    Then I wait until element to be clickable and click to "hesabim button" element
    Then I sleep for 2 seconds
    When I see "HesabimPage" page
    Then I wait "urunlerim;siparislerim;bildirimlerim;taleplerim;favorilerim;stok habercim;kuponlarim;hediye ceklerim;bilgilerim;cikis yap" elements
    Then I scroll down until find "kisiler bilgiler onay" element
#    Then I scroll down until find "yeni adres ekle button" element
    Then I wait until element to be clickable and click to "yeni adres ekle button" element
    When I see "AdresPage" page
    Then I check "Adres Bilgileri Text" element text is equal "Adres Bilgileri"
    Then I wait "Bireysel;Kurumsal;Ad Soyad;Telefon;il;ilce;Mahalle;Adres Detaylari;Adres Adi" elements
    Then I send key to "Ad Soyad" element text:"Enis Albayrak"
    Then I send key to "Telefon" element text:"5071552594"
    Then I send key to "Adres Detaylari" element text:"Kosova Mahallesi Veysel karani caddesi no 162"
    Given I create a adress that is start "Ev adresim" and end with number 100 between 100000
    Then I choose city "KONYA" from list
    Then I choose town "SELÇUKLU" from list
    Then I choose neighborhood "KOSOVA" from list
    Then I sleep for 2 seconds
    Then I wait until element to be clickable and click to "Adres Kaydet" element
    Then I sleep for 5 seconds


    Examples:
      | username             | password    | url                                        |
      | bekos1test@gmail.com | Albayrak.41 | https://akamai-s1-astra-stage.beko.com.tr/ |