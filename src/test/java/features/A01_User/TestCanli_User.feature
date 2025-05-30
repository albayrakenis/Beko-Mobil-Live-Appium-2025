@smoke
Feature: Kullanici testleri canli

  Background:
    When I see "HomePage" page
    Then I go to url:"https://www.beko.com.tr/"
    Then I wait "uyelik button" element
    Then I sleep for 3 seconds
    Then I wait until element to be clickable and click to "Cerezleri kabul et" element
    Then I wait until element to be clickable and click to "uyelik button" element
    When I see "LoginPage" page
    Then I wait "username" element
    Then I wait "password" element


  @user2C @canli @adresSilC @regresyon
  Scenario Outline: Test100- Canli Onceki Adresleri Silme

    Then I login with "<username>" and "<password>" canli
    And I scroll until find "giris yap" element with action
    Then I wait until element to be clickable and click to "giris yap" element
    Then I sleep for 7 seconds
    When I see "HomePage" page
    Then I wait until element to be clickable and click to "hesabim button" element
    Then I sleep for 2 seconds
    When I see "HesabimPage" page
    And  I delete saved adress


    Examples:
      | username       | password | url      |
      | kullaniciCanli | sifre    | urlCanli |


  @userC @loginSuccessC @canli @regresyon
  Scenario Outline: Test101- Canli Basarili Giris

    Then I login with "<username>" and "<password>" canli
    And I scroll until find "giris yap" element with action
    Then I wait until element to be clickable and click to "giris yap" element
    When I see "HomePage" page
    And I wait "urunler button" element
    And I sleep for 5 seconds
    And I wait "Hesabim button" element


    Examples:
      | username       | password | url      |
      | kullaniciCanli | sifre    | urlCanli |


  @userC  @yanlissifre @canli @regresyon
  Scenario Outline: Test102- Canli Yanlis Sifre ile Giris Denemesi

    Then I send key to "username" element text:"<username>"
    Then I send key to "password" element text:"<password>"
    And I scroll until find "giris yap" element with action
    Then I wait until element to be clickable and click to "giris yap" element
    Then I check "login hata mesaji" element text is equal "E-posta adresiniz ya da şifreniz yanlış"
    And I sleep for 5 seconds


    Examples:
      | username              | password | url      |
      | bekos1.test@gmail.com | abcd123  | urlCanli |



  @userC @yanlissifre @canli @regresyon
  Scenario Outline: Test103- Canli Yanlis Kullanici Adi ile Giriş Denemesi

    Then I send key to "username" element text:"<username>"
    Then I send key to "password" element text:"<password>"
    And I scroll until find "giris yap" element with action
    Then I wait until element to be clickable and click to "giris yap" element
    Then I check "login hata mesaji" element text is equal "E-posta adresiniz ya da şifreniz yanlış"
    And I sleep for 5 seconds


    Examples:
      | username       | password    | url      |
      | abcd@gmail.com | Albayrak.41 | urlCanli |


  @userAdresC  @regresyon @canli
  Scenario Outline:Test104- Canli Adres Ekleme


    Then I login with "<username>" and "<password>" canli
    And I scroll until find "giris yap" element with action
    Then I wait until element to be clickable and click to "giris yap" element
    Then I sleep for 7 seconds
    When I see "HomePage" page
    Then I wait until element to be clickable and click to "Hesabim button" element
    Then I sleep for 2 seconds
    When I see "HesabimPage" page
    Then I wait "urunlerim;siparislerim;bildirimlerim;taleplerim;favorilerim;stok habercim;kuponlarim;hediye ceklerim;bilgilerim;cikis yap" elements
    Then I sleep for 2 seconds
    And I scroll until find "yeni adres ekle button" element with action
    Then I sleep for 2 seconds
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
    Then I sleep for 1 seconds


    Examples:
      | username       | password | url      |
      | kullaniciCanli | sifre    | urlCanli |


  @userAdres2C  @regresyon @canli
  Scenario Outline:Test105- Canli Kurumsal Adres Ekleme


    Then I login with "<username>" and "<password>" canli
    And I scroll until find "giris yap" element with action
    Then I wait until element to be clickable and click to "giris yap" element
    Then I sleep for 10 seconds
    When I see "HomePage" page
    Then I wait until element to be clickable and click to "hesabim button" element
    Then I sleep for 10 seconds
    When I see "HesabimPage" page
    Then I wait "urunlerim;siparislerim;bildirimlerim;taleplerim;favorilerim;stok habercim;kuponlarim;hediye ceklerim;bilgilerim;cikis yap" elements
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
      | username       | password | url      |
      | kullaniciCanli | sifre    | urlCanli |


  @updateC @smokeC @regresyon @canli
  Scenario Outline: Test106- Canli Ad Soyad Güncelleme


    Then I login with "<username>" and "<password>" canli
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
      | username       | password | url      |
      | kullaniciCanli | sifre    | urlCanli |