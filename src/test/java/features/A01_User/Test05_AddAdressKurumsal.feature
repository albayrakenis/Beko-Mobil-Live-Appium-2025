Feature: Kullanici islemleri


  @userAdres2 @smoke
  Scenario Outline:Test05- Kurumsal Adres Ekleme

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
    Then I sleep for 10 seconds
    When I see "HomePage" page
    Then I wait until element to be clickable and click to "hesabim button" element
    Then I sleep for 10 seconds
    When I see "HesabimPage" page
    Then I wait "urunlerim;siparislerim;bildirimlerim;taleplerim;favorilerim;stok habercim;kuponlarim;hediye ceklerim;bilgilerim;cikis yap" elements
#    Then I scroll down until find "yeni adres ekle button" element
    And I scroll until find "yeni adres ekle button" element with action
    Then I wait until element to be clickable and click to "yeni adres ekle button" element
    When I see "AdresPage" page
    Then I check "Adres Bilgileri Text" element text is equal "Adres Bilgileri"
    Then I wait "Bireysel;Kurumsal;Ad Soyad;Telefon;il;ilce;Mahalle;Adres Detaylari;Adres Adi" elements
    Then I wait until element to be clickable and click to "Kurumsal" element
    Then I send key to "Firma Adi" element text:"Albayrak AŞ"
    Then I send key to "Vergi Numarasi" element text:"3579247337"
    Then I choose taxCity "ANKARA-EVREN" from list
    Then I send key to "Telefon" element text:"5071552594"
    Then I choose city "KONYA" from list
    Then I choose town "SELÇUKLU" from list
    Then I choose neighborhood "KOSOVA" from list
    Then I send key to "Adres Detaylari" element text:"Kosova Mahallesi Veysel karani caddesi no 162"
    Given I create a adress that is start "is adresim" and end with number 100 between 100000
    Then I sleep for 1 seconds
    Then I wait until element to be clickable and click to "Adres Kaydet" element
    Then I sleep for 1 seconds


    Examples:
      | username             | password    | url                                        |
      | bekos1test@gmail.com | Albayrak.41 | https://akamai-s1-astra-stage.beko.com.tr/ |