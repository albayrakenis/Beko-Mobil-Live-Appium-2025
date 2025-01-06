@payment @regression
Feature: Ödeme İşlemleri

  Background: Ortak Adımlar
    When I see "HomePage" page
    Then I go to url:"https://www.beko.com.tr"
    Then I wait "giris yap" element
    Then I wait until element to be clickable and click to "giris yap" element
    Then I login with valid credentials
    Then I add product to cart
    Then I proceed to checkout

  @payment_methods
  Scenario Outline: Farklı Ödeme Yöntemleri
    Then I wait "odeme secenekleri" element
    Then I wait until element to be clickable and click to "<payment_method>" element
    Then I wait "<payment_form>" element
    Then I fill "<payment_form>" with valid data
    Then I wait until element to be clickable and click to "odeme yap" element
    Then I wait "success message" element
    Then I check "success message" element text is equal "Ödemeniz başarıyla alındı"

    Examples:
      | payment_method | payment_form          |
      | kredi karti   | credit_card_form      |
      | havale        | bank_transfer_form     |
      | kapida odeme  | cash_on_delivery_form |

  @installment_options
  Scenario: Taksit Seçenekleri Kontrolü
    Then I wait "kredi karti" element
    Then I wait until element to be clickable and click to "kredi karti" element
    Then I wait "taksit secenekleri" element
    Then I wait until element to be clickable and click to "banka sec" element
    Then I wait until element to be clickable and click to "Garanti" element
    Then I check installment options are available
    Then I wait until element to be clickable and click to "6 taksit" element
    Then I check installment amount is calculated correctly

  @billing_info
  Scenario: Fatura Bilgileri Formu
    Then I wait "fatura bilgileri" element
    Then I select "Bireysel" from "fatura tipi"
    Then I wait "fatura formu" element
    When I send key to "ad soyad" element text:"Test User"
    When I send key to "tc kimlik" element text:"12345678901"
    When I send key to "telefon" element text:"5551234567"
    When I send key to "email" element text:"test@example.com"
    Then I wait until element to be clickable and click to "devam et" element
    Then I check billing information is saved correctly

  @shipping_options
  Scenario: Kargo Seçenekleri
    Then I wait "kargo secenekleri" element
    Then I check available shipping options
    Then I wait until element to be clickable and click to "mng kargo" element
    Then I check shipping price is displayed
    Then I wait until element to be clickable and click to "devam et" element
    Then I check selected shipping option is saved

  @gift_package
  Scenario: Hediye Paketi Seçeneği
    Then I wait "hediye paketi" element
    Then I wait until element to be clickable and click to "hediye paketi" element
    Then I wait "hediye notu" element
    When I send key to "hediye notu" element text:"İyi ki doğdun!"
    Then I check gift package price is added to total
    Then I wait until element to be clickable and click to "devam et" element
    Then I check gift package option is saved

  @payment_validation
  Scenario: Ödeme Validasyonu
    Then I wait "kredi karti" element
    Then I wait until element to be clickable and click to "kredi karti" element
    Then I wait "kart numarasi" element
    When I send key to "kart numarasi" element text:"4111"
    Then I check "kart numarasi error" element text is equal "Geçerli bir kart numarası giriniz"
    When I send key to "son kullanma" element text:"13/25"
    Then I check "son kullanma error" element text is equal "Geçerli bir son kullanma tarihi giriniz"
    When I send key to "cvv" element text:"12"
    Then I check "cvv error" element text is equal "Geçerli bir CVV giriniz"

  @order_summary
  Scenario: Sipariş Özeti Kontrolü
    Then I wait "siparis ozeti" element
    Then I check "urun toplami" element is visible
    Then I check "kargo ucreti" element is visible
    Then I check "toplam tutar" element is visible
    Then I check total amount calculation is correct
    Then I check "taksit tutari" element is visible when installment selected
