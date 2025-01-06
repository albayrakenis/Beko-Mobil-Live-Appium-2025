@live_support @regression
Feature: Canlı Destek

  Background: Ortak Adımlar
    When I see "HomePage" page
    Then I go to url:"https://www.beko.com.tr"

  @start_chat
  Scenario: Canlı Destek Başlatma
    Then I wait "canli destek" element
    Then I wait until element to be clickable and click to "canli destek" element
    Then I wait "chat window" element
    Then I wait "isim input" element
    When I send key to "isim input" element text:"Test User"
    When I send key to "email input" element text:"test@example.com"
    When I send key to "telefon input" element text:"5551234567"
    Then I wait until element to be clickable and click to "baslat button" element
    Then I wait "chat active" element
    Then I check chat session is started

  @send_message
  Scenario: Mesaj Gönderme
    Then I start chat session
    Then I wait "mesaj input" element
    When I send key to "mesaj input" element text:"Merhaba, bir sorum var"
    Then I wait until element to be clickable and click to "gonder button" element
    Then I wait "sent message" element
    Then I check message is displayed in chat
    Then I check message timestamp is correct

  @file_sharing
  Scenario: Dosya Paylaşımı
    Then I start chat session
    Then I wait "dosya ekle" element
    Then I wait until element to be clickable and click to "dosya ekle" element
    Then I upload "test_file.pdf" to "dosya input" element
    Then I wait "uploaded file" element
    Then I check file is shared in chat
    Then I check file can be downloaded

  @support_categories
  Scenario: Destek Kategorileri
    Then I wait "canli destek" element
    Then I wait until element to be clickable and click to "canli destek" element
    Then I wait "kategori dropdown" element
    Then I wait until element to be clickable and click to "kategori dropdown" element
    Then I check following categories exist:
      | Sipariş Takibi     |
      | Teknik Destek      |
      | İade ve İptal      |
      | Ürün Bilgisi       |
      | Ödeme Sorunları    |
    Then I wait until element to be clickable and click to "Teknik Destek" element
    Then I check relevant support agent is assigned

  @satisfaction_survey
  Scenario: Memnuniyet Anketi
    Then I start and complete chat session
    Then I wait "chat sonlandir" element
    Then I wait until element to be clickable and click to "chat sonlandir" element
    Then I wait "anket" element
    Then I wait until element to be clickable and click to "5 yildiz" element
    When I send key to "anket yorum" element text:"Çok yardımcı oldunuz, teşekkürler"
    Then I wait until element to be clickable and click to "gonder" element
    Then I check survey is submitted successfully

  @chat_history
  Scenario: Görüşme Geçmişi
    Then I login with valid credentials
    Then I wait "hesabim" element
    Then I wait until element to be clickable and click to "hesabim" element
    Then I wait "destek gecmisi" element
    Then I wait until element to be clickable and click to "destek gecmisi" element
    Then I check chat history is displayed
    Then I check chat transcripts are available

  @offline_support
  Scenario: Çevrimdışı Destek
    Then I simulate offline hours
    Then I wait "canli destek" element
    Then I wait until element to be clickable and click to "canli destek" element
    Then I check "offline message" element text contains "Şu anda müsait değiliz"
    Then I wait "mesaj birak" element
    Then I fill offline support form
    Then I check offline message is sent successfully

  @chat_reconnect
  Scenario: Bağlantı Kopması Durumu
    Then I start chat session
    Then I simulate connection loss
    Then I wait "baglanti koptu" element
    Then I wait "yeniden baglan" element
    Then I wait until element to be clickable and click to "yeniden baglan" element
    Then I check chat session is restored
    Then I check previous messages are visible

  @chat_transfer
  Scenario: Görüşme Transferi
    Then I start chat session
    Then I wait "mesaj input" element
    When I send key to "mesaj input" element text:"Teknik bir sorum var"
    Then I wait until element to be clickable and click to "gonder button" element
    Then I wait "transfer message" element
    Then I check "transfer message" element text contains "Teknik destek ekibine bağlanıyorsunuz"
    Then I check new support agent is connected
