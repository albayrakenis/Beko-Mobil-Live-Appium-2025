@campaigns @regression
Feature: Kampanyalar ve Promosyonlar

  Background: Ortak Adımlar
    When I see "HomePage" page
    Then I go to url:"https://www.beko.com.tr"
    Then I wait "kampanyalar link" element
    Then I wait until element to be clickable and click to "kampanyalar link" element

  @campaign_navigation
  Scenario: Kampanya Sayfası Navigasyonu
    Then I wait "kampanya listesi" element
    Then I check element count is greater than "0" with xpath "//div[@class='campaign-list']//div[@class='campaign-item']"
    Then I wait until element to be clickable and click to "first campaign" element
    Then I wait "kampanya detay" element
    Then I check "kampanya baslik" element is visible
    Then I check "kampanya aciklama" element is visible
    Then I check "kampanya kosullari" element is visible

  @campaign_details
  Scenario: Kampanya Detayları Kontrolü
    Then I wait until element to be clickable and click to "first campaign" element
    Then I wait "kampanya detay" element
    Then I check "kampanya baslangic tarihi" element is visible
    Then I check "kampanya bitis tarihi" element is visible
    Then I check "kampanya urun listesi" element is visible
    Then I check element count is greater than "0" with xpath "//div[@class='campaign-products']//div[@class='product-item']"

  @campaign_product_price
  Scenario: Kampanya Ürün Fiyat Kontrolü
    Then I wait until element to be clickable and click to "first campaign" element
    Then I wait "kampanya urun listesi" element
    Then I wait until element to be clickable and click to "first product" element
    Then I wait "urun detay" element
    Then I check "indirimli fiyat" element is visible
    Then I check "eski fiyat" element is visible
    Then I check "indirim orani" element is visible
    Then I check campaign discount is calculated correctly

  @coupon_code
  Scenario: Kupon Kodu Uygulama
    Then I wait until element to be clickable and click to "first campaign" element
    Then I wait "kupon kodu" element
    Then I get and save coupon code
    Then I wait until element to be clickable and click to "first product" element
    Then I wait "sepete ekle" element
    Then I wait until element to be clickable and click to "sepete ekle" element
    Then I wait "sepetim" element
    Then I wait until element to be clickable and click to "sepetim" element
    Then I wait "kupon kodu input" element
    When I send key to "kupon kodu input" element text:saved_coupon_code
    Then I wait until element to be clickable and click to "kupon uygula" element
    Then I wait "indirim tutari" element
    Then I check "indirim tutari" element is visible
    Then I check discount amount is calculated correctly

  @campaign_duration
  Scenario: Kampanya Süre Kontrolü
    Then I wait until element to be clickable and click to "first campaign" element
    Then I wait "kampanya detay" element
    Then I check campaign is within valid date range
    Then I check "kalan sure" element is visible
    Then I check remaining time is calculated correctly

  @campaign_filter
  Scenario: Kampanya Filtreleme
    Then I wait "filtreler" element
    Then I wait until element to be clickable and click to "kategori dropdown" element
    Then I wait until element to be clickable and click to "Beyaz Esya" element
    Then I wait "filtered campaigns" element
    Then I check all campaigns belong to selected category
    Then I wait until element to be clickable and click to "siralama dropdown" element
    Then I wait until element to be clickable and click to "En Yeni" element
    Then I check campaigns are sorted by date

  @campaign_share
  Scenario: Kampanya Paylaşımı
    Then I wait until element to be clickable and click to "first campaign" element
    Then I wait "paylas button" element
    Then I wait until element to be clickable and click to "paylas button" element
    Then I wait "sosyal medya butonlari" element
    Then I check "facebook share" element is visible
    Then I check "twitter share" element is visible
    Then I check "whatsapp share" element is visible
    Then I check share links are valid

  @campaign_notification
  Scenario: Kampanya Bildirimi Alma
    Then I wait "kampanya bildirim" element
    Then I wait until element to be clickable and click to "kampanya bildirim" element
    Then I wait "email input" element
    When I send key to "email input" element text:"test@example.com"
    Then I wait until element to be clickable and click to "bildirim kaydet" element
    Then I wait "success message" element
    Then I check "success message" element text contains "Kampanya bildirimleri için kaydınız alınmıştır"
