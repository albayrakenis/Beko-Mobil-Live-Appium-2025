@support @regression
Feature: Teknik Destek ve Servis Randevusu Detaylı Testler

  Background: Ortak Adımlar
    When I see "HomePage" page
    Then I go to url:"https://www.beko.com.tr"
    Then I wait "Teknik destek footer" element
    Then I wait until element to be clickable and click to "Teknik destek footer" element
    Then I see "Servis" page

  @invalid_warranty_query
  Scenario Outline: Geçersiz Ürün Seri Numarası ile Garanti Sorgulama
    Then I wait "Garanti Sorgula" element
    Then I wait until element to be clickable and click to "Garanti Sorgula" element
    Then I wait "urun seri no input;sorgula button" elements
    When I send key to "urun seri no input" element text:"<serial_number>"
    Then I wait until element to be clickable and click to "sorgula button" element
    Then I wait "error message" element
    Then I check "error message" element text is equal "<error_message>"

    Examples:
      | serial_number | error_message                                |
      | 123          | Geçerli bir seri numarası giriniz           |
      | ABC123       | Seri numarası sadece rakam içermelidir      |
      |              | Seri numarası alanı zorunludur              |
      | 99999999999  | Girilen seri numarası sistemde bulunamadı   |

  @service_request_types
  Scenario Outline: Farklı Arıza Tipleri için Servis Talebi
    Then I wait "Yeni Talep Olusturma" element
    Then I wait until element to be clickable and click to "Yeni Talep Olusturma" element
    Then I wait "urun kategori;urun model;ariza tipi;musteri bilgileri" elements
    # Ürün kategorisi seç
    Then I wait until element to be clickable and click to "urun kategori" element
    Then I wait until element to be clickable and click to "<kategori>" element
    # Ürün modeli seç
    Then I wait until element to be clickable and click to "urun model" element
    Then I wait until element to be clickable and click to "<model>" element
    # Arıza tipi seç
    Then I wait until element to be clickable and click to "ariza tipi" element
    Then I wait until element to be clickable and click to "<ariza>" element
    # Müşteri bilgilerini doldur
    Then I wait "isim input;soyisim input;telefon input;email input" elements
    When I send key to "isim input" element text:"Test"
    When I send key to "soyisim input" element text:"User"
    When I send key to "telefon input" element text:"5551234567"
    When I send key to "email input" element text:"test@example.com"
    Then I wait until element to be clickable and click to "talep olustur button" element
    Then I wait "success message" element
    Then I check "success message" element text is equal "Servis talebiniz başarıyla oluşturuldu"

    Examples:
      | kategori      | model           | ariza                    |
      | Buzdolabi     | XYZ123          | Soğutma Problemi        |
      | Camasir       | ABC456          | Çalışmıyor              |
      | Bulasik       | DEF789          | Su Almıyor              |
      | Televizyon    | TV123           | Görüntü Yok             |

  @service_location_query
  Scenario Outline: Farklı Lokasyonlar için Yetkili Servis Sorgulama
    Then I wait "Yetkili Servis Sorgulama" element
    Then I wait until element to be clickable and click to "Yetkili Servis Sorgulama" element
    Then I wait "il select;ilce select;mahalle input;sorgula button" elements
    # İl seç
    Then I wait until element to be clickable and click to "il select" element
    Then I wait until element to be clickable and click to "<il>" element
    # İlçe seç
    Then I wait until element to be clickable and click to "ilce select" element
    Then I wait until element to be clickable and click to "<ilce>" element
    # Mahalle gir
    When I send key to "mahalle input" element text:"<mahalle>"
    Then I wait until element to be clickable and click to "sorgula button" element
    Then I wait "servis listesi" element
    Then I check element count is greater than "0" with xpath "//div[@class='service-list']"

    Examples:
      | il        | ilce      | mahalle     |
      | İstanbul  | Kadıköy   | Caferağa    |
      | Ankara    | Çankaya   | Bahçeli     |
      | İzmir     | Konak     | Alsancak    |
      | Bursa     | Nilüfer   | Karaman     |

  @warranty_package_price
  Scenario Outline: Garanti Uzatma Paketlerinin Fiyat Kontrolü
    Then I wait "Garanti Uzatma" element
    Then I wait until element to be clickable and click to "Garanti Uzatma" element
    Then I wait "urun seri no input;garanti paket secimi" elements
    When I send key to "urun seri no input" element text:"<serial_number>"
    Then I wait until element to be clickable and click to "garanti paket secimi" element
    Then I wait until element to be clickable and click to "<paket>" element
    Then I wait "paket fiyat" element
    Then I check "paket fiyat" element text is equal "<fiyat>"

    Examples:
      | serial_number | paket          | fiyat    |
      | 1234567890   | 1 Yıl Uzatma   | 499 TL   |
      | 2345678901   | 2 Yıl Uzatma   | 899 TL   |
      | 3456789012   | 3 Yıl Uzatma   | 1299 TL  |

  @service_appointment_datetime
  Scenario: Servis Randevusu Tarih ve Saat Seçimi
    Then I wait "Yeni Talep Olusturma" element
    Then I wait until element to be clickable and click to "Yeni Talep Olusturma" element
    Then I wait "urun kategori" element
    Then I wait until element to be clickable and click to "urun kategori" element
    Then I wait until element to be clickable and click to "Buzdolabi" element
    # Randevu tarih ve saat seçimi
    Then I wait "randevu tarih;randevu saat" elements
    Then I wait until element to be clickable and click to "randevu tarih" element
    # Gelecek haftanın bir gününü seç
    Then I wait until element to be clickable and click to "next_week_day" element
    Then I wait until element to be clickable and click to "randevu saat" element
    Then I wait until element to be clickable and click to "available_time_slot" element
    # Randevu onayı
    Then I wait until element to be clickable and click to "randevu onayla button" element
    Then I wait "success message" element
    Then I check "success message" element text is equal "Randevunuz başarıyla oluşturuldu"

  @service_request_cancel
  Scenario: Servis Talebi İptali
    # Önce giriş yapılmalı
    When I wait until element to be clickable and click to "Hesabim button" element
    Then I see "LoginPage" page
    Then I wait "username;password;giris yap" elements
    When I send key to "username" element text:"test_user@example.com"
    When I send key to "password" element text:"Test123!"
    Then I wait until element to be clickable and click to "giris yap" element
    # Açık taleplere git
    Then I wait "Acik Taleplerim" element
    Then I wait until element to be clickable and click to "Acik Taleplerim" element
    Then I wait "talep listesi" element
    # İlk talebi iptal et
    Then I wait "iptal button" element
    Then I wait until element to be clickable and click to "iptal button" element
    Then I wait "iptal onay button" element
    Then I wait until element to be clickable and click to "iptal onay button" element
    Then I wait "success message" element
    Then I check "success message" element text is equal "Servis talebiniz iptal edildi"
