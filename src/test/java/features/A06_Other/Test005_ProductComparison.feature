@compare @regression
Feature: Ürün Karşılaştırma İşlemleri

  Background: Ortak Adımlar
    When I see "HomePage" page
    Then I go to url:"https://www.beko.com.tr"
    Then I wait "urunler button" element
    Then I wait until element to be clickable and click to "urunler button" element
    Then I wait until element to be clickable and click to "Beyaz esya" element
    Then I see "PLP" page
    Then I wait "product footer" element

  @compare_add_products
  Scenario: İki Ürünü Karşılaştırma Listesine Ekleme
    # İlk ürünü karşılaştırmaya ekle
    Then I wait "first product compare checkbox" element
    Then I wait until element to be clickable and click to "first product compare checkbox" element
    Then I wait "karsilastirma popup" element
    Then I check "karsilastirma sayac" element text contains "1"
    # İkinci ürünü karşılaştırmaya ekle
    Then I wait "second product compare checkbox" element
    Then I wait until element to be clickable and click to "second product compare checkbox" element
    Then I check "karsilastirma sayac" element text contains "2"
    # Karşılaştır butonuna tıkla
    Then I wait "karsilastir button" element
    Then I wait until element to be clickable and click to "karsilastir button" element
    Then I see "ComparePage" page
    Then I wait "karsilastirma tablosu" element

  @compare_max_products
  Scenario: Maksimum Ürün Karşılaştırma Limiti Kontrolü
    # 4 ürün ekle (maksimum limit)
    Then I wait "first product compare checkbox" element
    Then I wait until element to be clickable and click to "first product compare checkbox" element
    Then I wait "second product compare checkbox" element
    Then I wait until element to be clickable and click to "second product compare checkbox" element
    Then I wait "third product compare checkbox" element
    Then I wait until element to be clickable and click to "third product compare checkbox" element
    Then I wait "fourth product compare checkbox" element
    Then I wait until element to be clickable and click to "fourth product compare checkbox" element
    # 5. ürün eklemeye çalış
    Then I wait "fifth product compare checkbox" element
    Then I wait until element to be clickable and click to "fifth product compare checkbox" element
    Then I wait "error message" element
    Then I check "error message" element text contains "En fazla 4 ürün karşılaştırabilirsiniz"

  @compare_remove_product
  Scenario: Karşılaştırma Listesinden Ürün Çıkarma
    # İki ürün ekle
    Then I wait "first product compare checkbox" element
    Then I wait until element to be clickable and click to "first product compare checkbox" element
    Then I wait "second product compare checkbox" element
    Then I wait until element to be clickable and click to "second product compare checkbox" element
    # Karşılaştırma sayfasına git
    Then I wait "karsilastir button" element
    Then I wait until element to be clickable and click to "karsilastir button" element
    Then I see "ComparePage" page
    # Bir ürünü çıkar
    Then I wait "first product remove button" element
    Then I wait until element to be clickable and click to "first product remove button" element
    Then I check "karsilastirma sayac" element text contains "1"

  @compare_different_categories
  Scenario: Farklı Kategorilerden Ürün Karşılaştırma Kontrolü
    # Buzdolabı kategorisinden ürün ekle
    Then I wait "first product compare checkbox" element
    Then I wait until element to be clickable and click to "first product compare checkbox" element
    # Çamaşır makinesi kategorisine git
    Then I wait until element to be clickable and click to "Camasir" element
    Then I wait "product footer" element
    # Çamaşır makinesini eklemeye çalış
    Then I wait "first product compare checkbox" element
    Then I wait until element to be clickable and click to "first product compare checkbox" element
    Then I wait "error message" element
    Then I check "error message" element text contains "Farklı kategorilerden ürün karşılaştırılamaz"

  @compare_features
  Scenario: Karşılaştırma Sayfasında Özellik Kontrolü
    # İki ürün ekle
    Then I wait "first product compare checkbox" element
    Then I wait until element to be clickable and click to "first product compare checkbox" element
    Then I wait "second product compare checkbox" element
    Then I wait until element to be clickable and click to "second product compare checkbox" element
    # Karşılaştırma sayfasına git
    Then I wait "karsilastir button" element
    Then I wait until element to be clickable and click to "karsilastir button" element
    Then I see "ComparePage" page
    # Özellik gruplarını kontrol et
    Then I wait "ozellik gruplari" element
    Then I check element exists with xpath "//div[contains(text(),'Enerji Tüketimi')]"
    Then I check element exists with xpath "//div[contains(text(),'Boyutlar')]"
    Then I check element exists with xpath "//div[contains(text(),'Kapasite')]"
    # Farklılıkları vurgula
    Then I wait "farkliliklari vurgula checkbox" element
    Then I wait until element to be clickable and click to "farkliliklari vurgula checkbox" element
    Then I wait "vurgulanan ozellikler" element

  @compare_print
  Scenario: Karşılaştırma Sonuçlarını Yazdırma
    # İki ürün ekle
    Then I wait "first product compare checkbox" element
    Then I wait until element to be clickable and click to "first product compare checkbox" element
    Then I wait "second product compare checkbox" element
    Then I wait until element to be clickable and click to "second product compare checkbox" element
    # Karşılaştırma sayfasına git
    Then I wait "karsilastir button" element
    Then I wait until element to be clickable and click to "karsilastir button" element
    Then I see "ComparePage" page
    # Yazdır butonuna tıkla
    Then I wait "yazdir button" element
    Then I wait until element to be clickable and click to "yazdir button" element
    # Yazdırma önizleme kontrolü
    Then I wait "yazdir onizleme" element
