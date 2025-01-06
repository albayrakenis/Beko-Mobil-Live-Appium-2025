@brands @regression
Feature: Markalar Sayfası İşlemleri

  Background: Ortak Adımlar
    When I see "HomePage" page
    Then I go to url:"https://akamai-s1-astra-stage.beko.com.tr/markalar"
    Then I wait "Markalar Text" element

  @brands_navigation
  Scenario Outline: Marka Sayfalarına Erişim
    Then I wait "<brand_element>" element
    Then I wait until element to be clickable and click to "<brand_element>" element
    Then I wait "brand header" element
    Then I check "brand header" element text is equal "<brand_name>"
    Then I wait "product list" element
    Then I check element count is greater than "0" with xpath "//div[@class='product-list']"

    Examples:
      | brand_element | brand_name |
      | Apple        | Apple      |
      | Samsung      | Samsung    |
      | Grundig      | Grundig    |
      | Philips      | Philips    |
      | Lenovo       | Lenovo     |

  @brands_product_categories
  Scenario: Marka Ürün Kategorilerini Kontrol Etme
    Then I wait "Apple" element
    Then I wait until element to be clickable and click to "Apple" element
    Then I wait "kategori filtreleri" element
    Then I check element exists with xpath "//div[contains(@class,'category-filters')]//a[contains(text(),'Telefon')]"
    Then I check element exists with xpath "//div[contains(@class,'category-filters')]//a[contains(text(),'Tablet')]"
    Then I check element exists with xpath "//div[contains(@class,'category-filters')]//a[contains(text(),'Aksesuar')]"

  @brands_filter_products
  Scenario: Marka Ürünlerini Filtreleme
    Then I wait "Samsung" element
    Then I wait until element to be clickable and click to "Samsung" element
    Then I wait "kategori filtreleri" element
    # Kategori filtresi uygula
    Then I wait until element to be clickable and click to "Telefon kategori" element
    Then I wait "product list" element
    Then I check element count is greater than "0" with xpath "//div[@class='product-list']//div[contains(@class,'phone-product')]"
    # Fiyat filtresi uygula
    Then I wait "fiyat filtresi" element
    Then I wait until element to be clickable and click to "fiyat araligi dropdown" element
    Then I wait until element to be clickable and click to "5000-10000 TL" element
    Then I wait "filtered product list" element

  @brands_sort_products
  Scenario: Marka Ürünlerini Sıralama
    Then I wait "Grundig" element
    Then I wait until element to be clickable and click to "Grundig" element
    Then I wait "siralama dropdown" element
    Then I wait until element to be clickable and click to "siralama dropdown" element
    Then I wait until element to be clickable and click to "fiyat artan" element
    Then I wait "product list" element
    # Fiyatların artan sırada olduğunu kontrol et
    Then I check prices are in ascending order

  @brands_product_count
  Scenario: Marka Ürün Sayısı Kontrolü
    Then I wait "Philips" element
    Then I wait until element to be clickable and click to "Philips" element
    Then I wait "urun sayisi text" element
    Then I get product count from "urun sayisi text" and save as "total_count"
    Then I wait "product list" element
    Then I check displayed product count equals to "total_count"

  @brands_search_within
  Scenario: Marka İçinde Ürün Arama
    Then I wait "Lenovo" element
    Then I wait until element to be clickable and click to "Lenovo" element
    Then I wait "marka arama kutusu" element
    When I send key to "marka arama kutusu" element text:"laptop"
    Then I wait until element to be clickable and click to "ara button" element
    Then I wait "product list" element
    Then I check all products contain text "laptop"

  @brands_compare_products
  Scenario: Marka Ürünlerini Karşılaştırma
    Then I wait "Samsung" element
    Then I wait until element to be clickable and click to "Samsung" element
    # İki ürün seç
    Then I wait "first product compare checkbox" element
    Then I wait until element to be clickable and click to "first product compare checkbox" element
    Then I wait "second product compare checkbox" element
    Then I wait until element to be clickable and click to "second product compare checkbox" element
    Then I wait "karsilastir button" element
    Then I wait until element to be clickable and click to "karsilastir button" element
    Then I see "ComparePage" page
    Then I wait "karsilastirma tablosu" element

  @brands_pagination
  Scenario: Marka Ürünleri Sayfalama
    Then I wait "Apple" element
    Then I wait until element to be clickable and click to "Apple" element
    Then I wait "pagination" element
    # İkinci sayfaya git
    Then I wait until element to be clickable and click to "next page button" element
    Then I wait "page 2" element
    Then I check "current page" element text is equal "2"
    Then I wait "product list" element
    Then I check element count is greater than "0" with xpath "//div[@class='product-list']"
