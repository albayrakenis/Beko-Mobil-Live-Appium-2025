@cart @regression
Feature: Sepet İşlemleri

  Background: Ortak Adımlar
    When I see "HomePage" page
    Then I go to url:"https://www.beko.com.tr"
    Then I wait "giris yap" element
    Then I wait until element to be clickable and click to "giris yap" element
    Then I login with valid credentials

  @add_to_cart
  Scenario: Ürün Sepete Ekleme
    Then I wait "urunler button" element
    Then I wait until element to be clickable and click to "urunler button" element
    Then I wait until element to be clickable and click to "Beyaz esya" element
    Then I wait "first product" element
    Then I wait until element to be clickable and click to "first product" element
    Then I wait "sepete ekle" element
    Then I wait until element to be clickable and click to "sepete ekle" element
    Then I wait "success message" element
    Then I check "success message" element text contains "Ürün sepetinize eklendi"
    Then I check "sepet count" element text contains "1"

  @remove_from_cart
  Scenario: Sepetten Ürün Çıkarma
    Then I add product to cart
    Then I wait "sepetim" element
    Then I wait until element to be clickable and click to "sepetim" element
    Then I wait "urun sil" element
    Then I wait until element to be clickable and click to "urun sil" element
    Then I wait "onay popup" element
    Then I wait until element to be clickable and click to "onay button" element
    Then I wait "empty cart message" element
    Then I check "empty cart message" element text contains "Sepetinizde ürün bulunmamaktadır"

  @update_quantity
  Scenario: Ürün Miktarı Güncelleme
    Then I add product to cart
    Then I wait "sepetim" element
    Then I wait until element to be clickable and click to "sepetim" element
    Then I wait "miktar artir" element
    Then I wait until element to be clickable and click to "miktar artir" element
    Then I wait "loading spinner" element disappears
    Then I check "urun miktar" element text contains "2"
    Then I check total price is updated correctly
    Then I wait until element to be clickable and click to "miktar azalt" element
    Then I wait "loading spinner" element disappears
    Then I check "urun miktar" element text contains "1"

  @cart_summary
  Scenario: Sepet Özeti Kontrolü
    Then I add multiple products to cart:
      | category    | count |
      | Beyaz esya | 2     |
      | Televizyon | 1     |
    Then I wait "sepetim" element
    Then I wait until element to be clickable and click to "sepetim" element
    Then I check "ara toplam" element is visible
    Then I check "kargo ucreti" element is visible
    Then I check "toplam tutar" element is visible
    Then I check cart calculations are correct

  @cart_discount
  Scenario: Sepet İndirimi Hesaplama
    Then I add product to cart
    Then I wait "sepetim" element
    Then I wait until element to be clickable and click to "sepetim" element
    Then I wait "indirim kodu" element
    When I send key to "indirim kodu" element text:"TEST10"
    Then I wait until element to be clickable and click to "indirim uygula" element
    Then I wait "indirim tutari" element
    Then I check discount is applied correctly
    Then I check total amount is updated with discount

  @stock_check
  Scenario: Stok Kontrolü
    Then I wait "urunler button" element
    Then I wait until element to be clickable and click to "urunler button" element
    Then I wait until element to be clickable and click to "Beyaz esya" element
    Then I wait "stokta yok urun" element
    Then I wait until element to be clickable and click to "stokta yok urun" element
    Then I check "sepete ekle" element is not clickable
    Then I check "stok yok message" element is visible

  @save_for_later
  Scenario: Sonra Al Listesine Ekleme
    Then I add product to cart
    Then I wait "sepetim" element
    Then I wait until element to be clickable and click to "sepetim" element
    Then I wait "sonra al" element
    Then I wait until element to be clickable and click to "sonra al" element
    Then I wait "success message" element
    Then I check "success message" element text contains "Ürün sonra al listesine eklendi"
    Then I check product is moved to save for later list

  @cart_persistence
  Scenario: Sepet Kalıcılığı
    Then I add product to cart
    Then I wait until element to be clickable and click to "cikis yap" element
    Then I wait "giris yap" element
    Then I wait until element to be clickable and click to "giris yap" element
    Then I login with valid credentials
    Then I wait "sepetim" element
    Then I wait until element to be clickable and click to "sepetim" element
    Then I check previously added products are still in cart

  @multiple_sellers
  Scenario: Farklı Satıcılardan Ürün Ekleme
    Then I add products from different sellers:
      | seller     | product  |
      | Beko      | Buzdolabi|
      | MarketPlace| Tablet  |
    Then I wait "sepetim" element
    Then I wait until element to be clickable and click to "sepetim" element
    Then I check products are grouped by seller
    Then I check shipping cost is calculated per seller
