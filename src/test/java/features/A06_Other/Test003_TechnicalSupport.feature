@support @regression
Feature: Teknik Destek ve Servis Randevusu İşlemleri

  Background: Ortak Adımlar
    When I see "HomePage" page
    Then I go to url:"https://www.beko.com.tr"
    Then I wait "Footer" elements

  @technical_support_navigation
  Scenario: Footer'dan Teknik Destek Sayfasına Erişim
    Then I wait "Teknik destek footer" element
    Then I wait until element to be clickable and click to "Teknik destek footer" element
    Then I see "Servis" page
    Then I wait "Beraber cozelim text" element
    And I check "Beraber cozelim text" element text is equal "Beraber Çözelim"


  @service_appointment_new
  Scenario: Yeni Servis Talebi Oluşturma
    Then I wait "Teknik destek footer" element
    Then I wait until element to be clickable and click to "Teknik destek footer" element
    Then I see "Servis" page
    Then I wait "Yeni Talep Olusturma" element
    Then I wait until element to be clickable and click to "Yeni Talep Olusturma" element
    # Talep formu doldurma adımları eklenecek
    Then I wait "urun kategori;urun model;ariza tipi;musteri bilgileri" elements

  @warranty_query
  Scenario: Garanti Sorgulama
    Then I wait "Teknik destek footer" element
    Then I wait until element to be clickable and click to "Teknik destek footer" element
    Then I see "Servis" page
    Then I wait "Garanti Sorgula" element
    Then I wait until element to be clickable and click to "Garanti Sorgula" element
    # Garanti sorgulama formu kontrolleri
    Then I wait "urun seri no input;sorgula button" elements

  @open_requests
  Scenario: Açık Talepleri Görüntüleme
    When I see "HomePage" page
    Then I wait until element to be clickable and click to "Cerezleri kabul et" element
    Then I wait until element to be clickable and click to "uyelik button" element
    When I see "LoginPage" page
    Then I wait "username" element
    Then I wait "password" element
    Then I login with "<username>" and "<password>"
    And I scroll until find "giris yap" element with action
    Then I wait until element to be clickable and click to "giris yap" element
    Then I sleep for 9 seconds
    When I wait until element to be clickable and click to "Hesabim button" element
    Then I see "LoginPage" page
    Then I wait "username;password;giris yap" elements
    When I send key to "username" element text:"bekos1.test@gmail.com"
    When I send key to "password" element text:"Test123!"
    Then I wait until element to be clickable and click to "giris yap" element
    # Teknik destek sayfasına git
    Then I wait "Teknik destek footer" element
    Then I wait until element to be clickable and click to "Teknik destek footer" element
    Then I see "Servis" page
    Then I wait "Acik Taleplerim" element
    Then I wait until element to be clickable and click to "Acik Taleplerim" element
    # Açık taleplerin listesini kontrol et
    Then I wait "talep listesi" element

  @authorized_service_query
  Scenario: Yetkili Servis Sorgulama
    Then I wait "Teknik destek footer" element
    Then I wait until element to be clickable and click to "Teknik destek footer" element
    Then I see "Servis" page
    Then I wait "Yetkili Servis Sorgulama" element
    Then I wait until element to be clickable and click to "Yetkili Servis Sorgulama" element
    # Servis sorgulama formu
    Then I wait "il select;ilce select;mahalle input;sorgula button" elements

  @product_manual
  Scenario: Ürün Kılavuzu İndirme
    Then I wait "Teknik destek footer" element
    Then I wait until element to be clickable and click to "Teknik destek footer" element
    Then I see "Servis" page
    Then I wait "Urun Kilavuzu" element
    Then I wait until element to be clickable and click to "Urun Kilavuzu" element
    # Kılavuz arama formu
    Then I wait "urun kategori select;model input;kilavuz ara button" elements

  @warranty_extension
  Scenario: Garanti Uzatma İşlemi
    Then I wait "Teknik destek footer" element
    Then I wait until element to be clickable and click to "Teknik destek footer" element
    Then I see "Servis" page
    Then I wait "Garanti Uzatma" element
    Then I wait until element to be clickable and click to "Garanti Uzatma" element
    # Garanti uzatma formu
    Then I wait "urun seri no input;garanti paket secimi;satin al button" elements
