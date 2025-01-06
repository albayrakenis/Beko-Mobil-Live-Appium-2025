@address @regression
Feature: Adres Yönetimi

  Background: Ortak Adımlar
    When I see "HomePage" page
    Then I go to url:"https://www.beko.com.tr"
    Then I wait "giris yap" element
    Then I wait until element to be clickable and click to "giris yap" element
    Then I login with valid credentials
    Then I wait "hesabim" element
    Then I wait until element to be clickable and click to "hesabim" element
    Then I wait until element to be clickable and click to "adreslerim" element

  @add_new_address
  Scenario: Yeni Adres Ekleme
    Then I wait "yeni adres ekle" element
    Then I wait until element to be clickable and click to "yeni adres ekle" element
    Then I wait "adres formu" element
    When I send key to "adres basligi" element text:"Ev Adresi"
    When I send key to "ad soyad" element text:"Test User"
    When I send key to "telefon" element text:"5551234567"
    Then I wait until element to be clickable and click to "il sec" element
    Then I wait until element to be clickable and click to "Istanbul" element
    Then I wait until element to be clickable and click to "ilce sec" element
    Then I wait until element to be clickable and click to "Kadikoy" element
    Then I wait until element to be clickable and click to "mahalle sec" element
    Then I wait until element to be clickable and click to "Caferaga" element
    When I send key to "adres detay" element text:"Test Sokak No:1 D:2"
    Then I wait until element to be clickable and click to "kaydet" element
    Then I wait "success message" element
    Then I check "success message" element text is equal "Adres başarıyla kaydedildi"

  @update_address
  Scenario: Adres Güncelleme
    Then I wait "duzenle button" element
    Then I wait until element to be clickable and click to "duzenle button" element
    Then I wait "adres formu" element
    When I clear "telefon" element
    When I send key to "telefon" element text:"5559876543"
    When I clear "adres detay" element
    When I send key to "adres detay" element text:"Updated Sokak No:2 D:3"
    Then I wait until element to be clickable and click to "kaydet" element
    Then I wait "success message" element
    Then I check "success message" element text is equal "Adres başarıyla güncellendi"
    Then I check updated information is displayed correctly

  @delete_address
  Scenario: Adres Silme
    Then I wait "sil button" element
    Then I wait until element to be clickable and click to "sil button" element
    Then I wait "onay popup" element
    Then I wait until element to be clickable and click to "onay button" element
    Then I wait "success message" element
    Then I check "success message" element text is equal "Adres başarıyla silindi"
    Then I check deleted address is not displayed

  @set_default_address
  Scenario: Varsayılan Adres Ayarlama
    Then I wait "varsayilan yap" element
    Then I wait until element to be clickable and click to "varsayilan yap" element
    Then I wait "success message" element
    Then I check "success message" element text is equal "Varsayılan adres güncellendi"
    Then I wait "varsayilan adres" element
    Then I proceed to checkout
    Then I check default address is selected automatically

  @address_validation
  Scenario: Adres Formu Validasyonu
    Then I wait "yeni adres ekle" element
    Then I wait until element to be clickable and click to "yeni adres ekle" element
    Then I wait "adres formu" element
    Then I wait until element to be clickable and click to "kaydet" element
    Then I check "ad soyad error" element text is equal "Ad soyad alanı zorunludur"
    Then I check "telefon error" element text is equal "Telefon alanı zorunludur"
    Then I check "il error" element text is equal "İl seçimi zorunludur"
    Then I check "adres detay error" element text is equal "Adres detayı zorunludur"
    When I send key to "telefon" element text:"555"
    Then I check "telefon error" element text is equal "Geçerli bir telefon numarası giriniz"

  @multiple_addresses
  Scenario: Çoklu Adres Yönetimi
    Then I wait "yeni adres ekle" element
    Then I add multiple addresses:
      | title          | name       | phone      | city     | district | address              |
      | Ev            | Test User  | 5551234567 | Istanbul | Kadikoy  | Test Sokak No:1 D:2  |
      | İş            | Test User  | 5559876543 | Istanbul | Sisli    | Work Sokak No:5 D:10 |
      | Yazlık        | Test User  | 5557894561 | Izmir    | Cesme    | Yaz Sokak No:3       |
    Then I check all addresses are listed correctly
    Then I check address count equals to "3"

  @delivery_address
  Scenario: Teslimat Adresi Kontrolü
    Then I add product to cart
    Then I proceed to checkout
    Then I wait "adres secimi" element
    Then I check all saved addresses are available for selection
    Then I wait until element to be clickable and click to "farkli teslimat" element
    Then I wait "yeni adres ekle" element
    Then I add new delivery address
    Then I check delivery address is saved separately
