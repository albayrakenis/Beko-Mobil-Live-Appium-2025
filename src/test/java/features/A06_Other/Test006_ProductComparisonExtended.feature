@compare @regression
Feature: Gelişmiş Ürün Karşılaştırma İşlemleri

  Background: Ortak Adımlar
    When I see "HomePage" page
    Then I go to url:"https://www.beko.com.tr"
    Then I wait "urunler button" element
    Then I wait until element to be clickable and click to "urunler button" element
    Then I wait until element to be clickable and click to "Beyaz esya" element
    Then I see "PLP" page
    Then I wait "product footer" element

  @compare_clear_list
  Scenario: Karşılaştırma Listesini Temizleme
    # Üç ürün ekle
    Then I wait "first product compare checkbox" element
    Then I wait until element to be clickable and click to "first product compare checkbox" element
    Then I wait "second product compare checkbox" element
    Then I wait until element to be clickable and click to "second product compare checkbox" element
    Then I wait "third product compare checkbox" element
    Then I wait until element to be clickable and click to "third product compare checkbox" element
    # Karşılaştırma sayfasına git
    Then I wait "karsilastir button" element
    Then I wait until element to be clickable and click to "karsilastir button" element
    Then I see "ComparePage" page
    # Listeyi temizle
    Then I wait "listeyi temizle button" element
    Then I wait until element to be clickable and click to "listeyi temizle button" element
    Then I wait "onay popup" element
    Then I wait until element to be clickable and click to "onay button" element
    # Listenin boş olduğunu kontrol et
    Then I check "karsilastirma sayac" element text is equal "0"
    Then I check element exists with xpath "//div[contains(text(),'Karşılaştırma listeniz boş')]"

  @compare_feature_filter
  Scenario: Özellik Filtresi Uygulama
    # İki ürün ekle
    Then I wait "first product compare checkbox" element
    Then I wait until element to be clickable and click to "first product compare checkbox" element
    Then I wait "second product compare checkbox" element
    Then I wait until element to be clickable and click to "second product compare checkbox" element
    # Karşılaştırma sayfasına git
    Then I wait "karsilastir button" element
    Then I wait until element to be clickable and click to "karsilastir button" element
    Then I see "ComparePage" page
    # Özellik filtreleme
    Then I wait "ozellik filtrele dropdown" element
    Then I wait until element to be clickable and click to "ozellik filtrele dropdown" element
    Then I wait until element to be clickable and click to "enerji tuketimi checkbox" element
    Then I wait until element to be clickable and click to "boyutlar checkbox" element
    Then I wait until element to be clickable and click to "filtre uygula button" element
    # Sadece seçili özelliklerin görüntülendiğini kontrol et
    Then I check element exists with xpath "//div[contains(text(),'Enerji Tüketimi')]"
    Then I check element exists with xpath "//div[contains(text(),'Boyutlar')]"
    Then I check element not exists with xpath "//div[contains(text(),'Programlar')]"

  @compare_share
  Scenario: Karşılaştırma Sonuçlarını Paylaşma
    # İki ürün ekle
    Then I wait "first product compare checkbox" element
    Then I wait until element to be clickable and click to "first product compare checkbox" element
    Then I wait "second product compare checkbox" element
    Then I wait until element to be clickable and click to "second product compare checkbox" element
    # Karşılaştırma sayfasına git
    Then I wait "karsilastir button" element
    Then I wait until element to be clickable and click to "karsilastir button" element
    Then I see "ComparePage" page
    # Paylaş butonuna tıkla
    Then I wait "paylas button" element
    Then I wait until element to be clickable and click to "paylas button" element
    Then I wait "paylas popup" element
    # E-posta ile paylaş
    Then I wait "email input" element
    When I send key to "email input" element text:"test@example.com"
    Then I wait until element to be clickable and click to "email gonder button" element
    Then I wait "success message" element
    Then I check "success message" element text is equal "Karşılaştırma sonuçları e-posta adresinize gönderildi"

  @compare_history
  Scenario: Karşılaştırma Geçmişini Görüntüleme
    # Önce giriş yapılmalı
    When I wait until element to be clickable and click to "Hesabim button" element
    Then I see "LoginPage" page
    Then I wait "username;password;giris yap" elements
    When I send key to "username" element text:"test_user@example.com"
    When I send key to "password" element text:"Test123!"
    Then I wait until element to be clickable and click to "giris yap" element
    # İki ürün karşılaştır
    Then I wait "first product compare checkbox" element
    Then I wait until element to be clickable and click to "first product compare checkbox" element
    Then I wait "second product compare checkbox" element
    Then I wait until element to be clickable and click to "second product compare checkbox" element
    Then I wait "karsilastir button" element
    Then I wait until element to be clickable and click to "karsilastir button" element
    # Geçmişe git
    Then I wait "karsilastirma gecmisi button" element
    Then I wait until element to be clickable and click to "karsilastirma gecmisi button" element
    Then I wait "gecmis listesi" element
    Then I check element exists with xpath "//div[@class='comparison-history-item']"

  @compare_favorites
  Scenario: Favorilerdeki Ürünleri Karşılaştırma
    # Önce giriş yapılmalı
    When I wait until element to be clickable and click to "Hesabim button" element
    Then I see "LoginPage" page
    Then I wait "username;password;giris yap" elements
    When I send key to "username" element text:"test_user@example.com"
    When I send key to "password" element text:"Test123!"
    Then I wait until element to be clickable and click to "giris yap" element
    # Favorilere git
    Then I wait "favorilerim" element
    Then I wait until element to be clickable and click to "favorilerim" element
    # Favori ürünleri karşılaştır
    Then I wait "first favorite compare checkbox" element
    Then I wait until element to be clickable and click to "first favorite compare checkbox" element
    Then I wait "second favorite compare checkbox" element
    Then I wait until element to be clickable and click to "second favorite compare checkbox" element
    Then I wait "karsilastir button" element
    Then I wait until element to be clickable and click to "karsilastir button" element
    Then I see "ComparePage" page
    Then I wait "karsilastirma tablosu" element

  @compare_save_pdf
  Scenario: Karşılaştırma Sonuçlarını PDF Olarak Kaydetme
    # İki ürün ekle
    Then I wait "first product compare checkbox" element
    Then I wait until element to be clickable and click to "first product compare checkbox" element
    Then I wait "second product compare checkbox" element
    Then I wait until element to be clickable and click to "second product compare checkbox" element
    # Karşılaştırma sayfasına git
    Then I wait "karsilastir button" element
    Then I wait until element to be clickable and click to "karsilastir button" element
    Then I see "ComparePage" page
    # PDF olarak kaydet
    Then I wait "pdf kaydet button" element
    Then I wait until element to be clickable and click to "pdf kaydet button" element
    Then I wait "download notification" element
    Then I check "success message" element text is equal "PDF başarıyla indirildi"
