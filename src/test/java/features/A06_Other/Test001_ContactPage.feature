@smoke @iletisim
Feature: İletişim Sayfası Testleri

  Background:
    When I see "HomePage" page
    And I go to url:"https://akamai-s1-astra-stage.beko.com.tr/iletisim"
    When I see "ContactPage" page
    Then I wait "iletisim formu" element

  @contact1 @smoke
  Scenario: Test01 - İletişim Sayfası Görüntüleme ve Temel Kontroller
    And I check "iletisim formu" element text is equal "İletişim Formu"
    And I wait "Cagri Merkezi Numarasi;E-posta Adresi;Adres Bilgisi" elements

  @contact2 @form @positive
  Scenario: Test02 - İletişim Formu Geçerli Veri ile Gönderme
    And I send key to "Ad" element text:"Test Kullanıcı"
    And I send key to "Soyad" element text:"Test Kullanıcı"
    And I send key to "E-posta" element text:"test@example.com"
    And I send key to "Telefon" element text:"5551234567"
    And I send key to "Mesaj" element text:"Bu bir test mesajıdır."
    And I choose city "KONYA" from list
    And I choose town "SELÇUKLU" from list
    And  I sleep for 2 seconds
    And I scroll until find "Sorulan Sorular" element with action
    #And I approved "KVKK" KVKK
    When I click "KVKK Onay" element
    When I click "Kaydet Butonu" element
    And  I sleep for 1 seconds
    Then I wait "Basarili Mesaj" element

  @contact3 @form @negative
  Scenario Outline: Test03 - İletişim Formu Hatalı Veri Kontrolü
    And I send key to "Ad" element text:"<ad_soyad>"
    And I send key to "Soyad" element text:"<ad_soyad>"
    And I send key to "E-posta" element text:"<email>"
    And I send key to "Telefon" element text:"<telefon>"
    And I send key to "Mesaj" element text:"<mesaj>"
    And I scroll until find "Sorulan Sorular" element with action
    When I click "Kaydet Butonu" element
    When I click "Kaydet Butonu" element
    And  I sleep for 3 seconds
    Then I wait "<Hata Mesaji>" element
    And I check "<Hata Mesaji>" element text is equal "<hata_mesaji>"

    Examples:
      | ad_soyad | email          | telefon    | mesaj | Hata Mesaji         | hata_mesaji                   |
      |          | test@email.com | 5551234567 | Test  | Hata Mesaji Ad      | Bu alan zorunludur.           |
      | Test     |                | 5551234567 | Test  | Hata Mesaji Mail    | E-mail formatı doğru değildir |
      | Test     | invalid-email  | 5551234567 | Test  | Hata Mesaji Mail    | E-mail formatı doğru değildir |
      | Test     | test@email.com |            | Test  | Hata Mesaji Telefon | Bu alan zorunludur.           |
      | Test     | test@email.com | 555        | Test  | Hata Mesaji Telefon | Bu alan zorunludur.           |
      | Test     | test@email.com | 5551234567 |       | Hata mesaj kutusu   | Bu alan zorunludur.           |

