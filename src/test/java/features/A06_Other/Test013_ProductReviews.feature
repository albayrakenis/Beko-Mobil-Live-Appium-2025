@reviews @regression
Feature: Ürün Değerlendirmeleri

  Background: Ortak Adımlar
    When I see "HomePage" page
    Then I go to url:"https://www.beko.com.tr"
    Then I wait "giris yap" element
    Then I wait until element to be clickable and click to "giris yap" element
    Then I login with valid credentials

  @write_review
  Scenario: Yorum Yazma
    Then I navigate to previously purchased product
    Then I wait "degerlendirme yap" element
    Then I wait until element to be clickable and click to "degerlendirme yap" element
    Then I wait "yildiz rating" element
    Then I wait until element to be clickable and click to "5 yildiz" element
    Then I wait "yorum basligi" element
    When I send key to "yorum basligi" element text:"Harika Ürün"
    When I send key to "yorum metni" element text:"Bu ürünü çok beğendim. Beklentilerimi karşıladı."
    Then I wait until element to be clickable and click to "gonder" element
    Then I wait "success message" element
    Then I check "success message" element text is equal "Değerlendirmeniz başarıyla gönderildi"

  @rating_submission
  Scenario Outline: Farklı Puanlarla Değerlendirme
    Then I navigate to previously purchased product
    Then I wait "degerlendirme yap" element
    Then I wait until element to be clickable and click to "degerlendirme yap" element
    Then I wait "yildiz rating" element
    Then I wait until element to be clickable and click to "<rating> yildiz" element
    Then I wait "yorum basligi" element
    When I send key to "yorum basligi" element text:"<title>"
    When I send key to "yorum metni" element text:"<comment>"
    Then I wait until element to be clickable and click to "gonder" element
    Then I wait "success message" element
    Then I check rating is saved as "<rating>"

    Examples:
      | rating | title           | comment                               |
      | 5      | Mükemmel       | Çok memnun kaldım                     |
      | 4      | İyi            | Genel olarak iyi                      |
      | 3      | Orta           | Beklentilerimi kısmen karşıladı      |
      | 2      | Kötü           | Bazı sorunlar var                     |
      | 1      | Çok Kötü       | Hiç memnun kalmadım                   |

  @photo_upload
  Scenario: Fotoğraf Yükleme
    Then I navigate to previously purchased product
    Then I wait "degerlendirme yap" element
    Then I wait until element to be clickable and click to "degerlendirme yap" element
    Then I wait "fotograf ekle" element
    Then I wait until element to be clickable and click to "fotograf ekle" element
    Then I upload "test_image.jpg" to "fotograf input" element
    Then I wait "yuklenen fotograf" element
    Then I check uploaded photo is displayed
    Then I wait until element to be clickable and click to "gonder" element
    Then I check photo is included in review

  @review_moderation
  Scenario: Yorum Moderasyon Kontrolü
    Then I submit review with inappropriate content
    Then I wait "moderation message" element
    Then I check "moderation message" element text is equal "Değerlendirmeniz moderasyon sürecindedir"
    Then I check review is not publicly visible
    Then I check review status in my account

  @review_filtering
  Scenario: Değerlendirme Filtreleme
    Then I navigate to product with reviews
    Then I wait "yorumlar tab" element
    Then I wait until element to be clickable and click to "yorumlar tab" element
    Then I wait "filtrele dropdown" element
    Then I wait until element to be clickable and click to "filtrele dropdown" element
    Then I wait until element to be clickable and click to "5 yildiz" element
    Then I check all displayed reviews have 5 stars
    Then I wait until element to be clickable and click to "fotograf yorumlar" element
    Then I check all displayed reviews have photos

  @helpful_review
  Scenario: Faydalı Yorum İşaretleme
    Then I navigate to product with reviews
    Then I wait "yorumlar tab" element
    Then I wait until element to be clickable and click to "yorumlar tab" element
    Then I wait "faydali button" element
    Then I wait until element to be clickable and click to "faydali button" element
    Then I wait "success message" element
    Then I check "success message" element text is equal "Teşekkürler"
    Then I check helpful count is increased

  @review_edit
  Scenario: Yorum Düzenleme
    Then I wait "hesabim" element
    Then I wait until element to be clickable and click to "hesabim" element
    Then I wait "degerlendirmelerim" element
    Then I wait until element to be clickable and click to "degerlendirmelerim" element
    Then I wait "duzenle button" element
    Then I wait until element to be clickable and click to "duzenle button" element
    Then I wait "yorum metni" element
    When I clear "yorum metni" element
    When I send key to "yorum metni" element text:"Güncellenmiş yorum metni"
    Then I wait until element to be clickable and click to "gonder" element
    Then I wait "success message" element
    Then I check "success message" element text is equal "Değerlendirmeniz başarıyla güncellendi"
    Then I check updated review is displayed correctly

  @review_delete
  Scenario: Yorum Silme
    Then I wait "hesabim" element
    Then I wait until element to be clickable and click to "hesabim" element
    Then I wait "degerlendirmelerim" element
    Then I wait until element to be clickable and click to "degerlendirmelerim" element
    Then I wait "sil button" element
    Then I wait until element to be clickable and click to "sil button" element
    Then I wait "onay popup" element
    Then I wait until element to be clickable and click to "onay button" element
    Then I check review is deleted successfully
