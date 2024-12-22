@qwe
Feature: İletişim Sayfası Testleri

  @contact @smoke
  Scenario: Test01 - İletişim Sayfası Görüntüleme ve Temel Kontroller
    When I see "HomePage" page
    When I go to "https://akamai-s1-astra-stage.beko.com.tr/iletisim" with configuration
    Then I wait "iletisim baslik" element
    Then I verify "iletisim baslik" element text equals to "İletişim"
    Then I verify page contains elements:
      | Çağrı Merkezi Numarası |
      | E-posta Adresi         |
      | Adres Bilgisi          |

  @contact @form @positive
  Scenario: Test02 - İletişim Formu Geçerli Veri ile Gönderme
    When I see "ContactPage" page
    When I go to "https://akamai-s1-astra-stage.beko.com.tr/iletisim" with configuration
    Then I wait "iletisim formu" element
    When I fill "Ad Soyad" with "Test Kullanıcı"
    When I fill "E-posta" with "test@example.com"
    When I fill "Telefon" with "5551234567"
    When I fill "Mesaj" with "Bu bir test mesajıdır."
    When I click "KVKK Onay" element
    When I click "Gönder Butonu" element
    Then I wait "Başarılı Mesaj" element 10 seconds
    Then I verify "Başarılı Mesaj" element contains text "Mesajınız başarıyla gönderildi"

  @contact @form @negative
  Scenario Outline: Test03 - İletişim Formu Hatalı Veri Kontrolü
    When I see "ContactPage" page
    When I go to "https://akamai-s1-astra-stage.beko.com.tr/iletisim" with configuration
    Then I wait "iletisim formu" element
    When I fill "Ad Soyad" with "<ad_soyad>"
    When I fill "E-posta" with "<email>"
    When I fill "Telefon" with "<telefon>"
    When I fill "Mesaj" with "<mesaj>"
    When I click "Gönder Butonu" element
    Then I wait "Hata Mesajı" element 5 seconds
    Then I verify "Hata Mesajı" element contains text "<hata_mesaji>"

    Examples:
      | ad_soyad | email           | telefon     | mesaj | hata_mesaji                    |
      |          | test@email.com  | 5551234567  | Test  | Ad Soyad alanı zorunludur     |
      | Test     |                 | 5551234567  | Test  | E-posta alanı zorunludur      |
      | Test     | invalid-email   | 5551234567  | Test  | Geçerli bir e-posta giriniz   |
      | Test     | test@email.com  |             | Test  | Telefon alanı zorunludur      |
      | Test     | test@email.com  | 555         | Test  | Geçerli bir telefon giriniz   |
      | Test     | test@email.com  | 5551234567  |       | Mesaj alanı zorunludur        |

  @contact @form @kvkk
  Scenario: Test04 - KVKK Onayı Kontrolü
    When I see "ContactPage" page
    When I go to "https://akamai-s1-astra-stage.beko.com.tr/iletisim" with configuration
    Then I wait "iletisim formu" element
    When I fill "Ad Soyad" with "Test Kullanıcı"
    When I fill "E-posta" with "test@example.com"
    When I fill "Telefon" with "5551234567"
    When I fill "Mesaj" with "Test mesajı"
    When I click "Gönder Butonu" element
    Then I wait "Hata Mesajı" element 5 seconds
    Then I verify "Hata Mesajı" element contains text "KVKK aydınlatma metnini onaylamanız gerekmektedir"
