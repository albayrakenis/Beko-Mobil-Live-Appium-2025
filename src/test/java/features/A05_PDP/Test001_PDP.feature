Feature: Satin Alma Islemleri



  @smoke  @order @pdp55
  Scenario Outline: Test09- Sepette Urun Sayisi Azaltma
    When I see "HomePage" page
    When I go to "<url>" with configuration
    Then I wait until element to be clickable and click to "Cerezleri kabul et" element
   # And I sleep for 3 seconds
    Then I wait "uyelik button" element
    When I see "HomePage" page
    Then I wait until element to be clickable and click to "urunler button" element
    When I see "HomePage" page
    And I hover "<header>" header and click "<baslik>" category
    When I see "PDP" page
    And I scroll until find "PLP Kategori Adi" element with action
    And I wait "PLP Kategori Adi" element
    And I scroll until find "Uc nokta" element with action
    And I wait until element to be clickable and click to "Uc nokta" element
   #And I wait until element to be clickable and click to "Favorilerime ekle" element
    And I wait until element to be clickable and click to "Popup kapatma" element
    And I scroll until find "Filtrele Button" element with action
    And I wait "Sirala button" element
    And I wait until element to be clickable and click to "Filtrele Button" element
    And I wait until element to be clickable and click to "Stok Durumu" element
    And I wait until element to be clickable and click to "Var Button" element
    And I wait until element to be clickable and click to "Uygula Button" element
    And I scroll until find "Pdp ilk urun" element with action
    And I wait until element to be clickable and click to "Pdp ilk urun" element
    And I wait "Sepete At Button;Evime ne zaman ulasir;Favorilere ekle kalp" elements
    And I scroll until find "urun teknik ozellikleri" element with action
    And I wait "Genel bakis;Teknik ozellikleri;Hangi magazada var;Taksit secenekleri;Yorumlar" elements
    And I wait until element to be clickable and click to "Hangi magazada var" element
    And I wait "il;ilce;Magaza bul;En yakin" elements

    Examples:
      | header         | baslik                     | url |
      | Beyaz Esya     | Buzdolabi                  | urlCanli |







  @smoke  @order @pdp2
  Scenario Outline: Test09- Sepette Urun Sayisi Azaltma
    When I see "HomePage" page
    When I go to "<url>" with configuration
    And I sleep for 5 seconds
    Then I wait "uyelik button" element
    Then I sleep for 3 seconds
    When I see "HomePage" page
    Then I wait until element to be clickable and click to "urunler button" element
    Then I sleep for 5 seconds
    When I see "HomePage" page
    And I hover "<header>" header and click "<baslik>" category
    #And I hover "Elektronik" header and click "Bilgisayar baslik" category with string

    When I see "PDP" page
    And I scroll until find "Uc nokta" element with action
    And I wait until element to be clickable and click to "Uc nokta" element
   #And I wait until element to be clickable and click to "Favorilerime ekle" element
    And I wait until element to be clickable and click to "Popup kapatma" element
    And I scroll until find "Filtrele Button" element with action
    And I wait until element to be clickable and click to "Filtrele Button" element
    And I wait until element to be clickable and click to "Stok Durumu" element
    And I wait until element to be clickable and click to "Var Button" element
    And I wait until element to be clickable and click to "Uygula Button" element
    And I scroll until find "Pdp ilk urun" element with action
    And I wait until element to be clickable and click to "Pdp ilk urun" element
    And I wait "Sepete At Button;Evime ne zaman ulasir;Favorilere ekle kalp" elements
    And I scroll until find "urun teknik ozellikleri" element with action
    And I wait "Genel bakis;Teknik ozellikleri;Hangi magazada var;Taksit secenekleri;Yorumlar" elements
    And I wait until element to be clickable and click to "Hangi magazada var" element
    And I wait "il;ilce;Magaza bul;En yakin" elements

    Examples:
      | header         | baslik                     | url |
      | Beyaz Esya     | Buzdolabi                  | url |
      | Beyaz Esya     | Derin Dondurucu            | url |
      | Beyaz Esya     | Bulasik Makinesi           | url |
      | Beyaz Esya     | Camasir Makinesi           | url |
      | Beyaz Esya     | Kurutma Makinesi           | url |
      | Beyaz Esya     | Kurutmali Camasir Makinesi | url |
      | Beyaz Esya     | Firin                      | url |
      | Beyaz Esya     | Mikrodalga                 | url |
      | Beyaz Esya     | Set Ustu                   | url |
      | Beyaz Esya     | Su Sebili                  | url |
      | Beyaz Esya     | Tum Urunler                | url |

      | Ankastre       | Ankastre Firin             | url |
      | Ankastre       | Ankastre Mikro Dalgalar    | url |
      | Ankastre       | Ankastre Ocaklar           | url |
      | Ankastre       | Ankastre Davlumbazlar      | url |
      | Ankastre       | Ankastre Aspiratorler      | url |
      | Ankastre       | Ankastre Bulasik Makinesi  | url |
      | Ankastre       | Ankastre Buzdolabi         | url |
      | Ankastre       | Tum Urunler                | url |

      | Televizyon     | 4K OLED TV                 | url |
      | Televizyon     | Google TV                  | url |
      | Televizyon     | Android TV                 | url |
      | Televizyon     | 4K UHD TV                  | url |
      | Televizyon     | Buyuk Ekran TV             | url |
      | Televizyon     | Smart TV                   | url |
      | Televizyon     | Full HD TV                 | url |
      | Televizyon     | LED & LCD TV               | url |
      | Televizyon     | QLED                       | url |
      | Televizyon     | Tum Urunler                | url |

      | Elektronik     | Cep Telefonu               | url |
      | Elektronik     | Cep Telefonu Aksesuarlar   | url |
      | Elektronik     | Giyilebilir Teknoloji      | url |
      | Elektronik     | Bilgisayar                 | url |
      | Elektronik     | Goruntu Sistemleri         | url |
      | Elektronik     | Odeme Sistemleri           | url |
      | Elektronik     | Hobi - Oyun                | url |
      | Elektronik     | Tum Urunler                | url |


      | isitma sogutma | Klima                      | url |
      | isitma sogutma | Kombi                      | url |
      | isitma sogutma | Termosifon                 | url |
      | isitma sogutma | Elektrikli Isitici         | url |
      | isitma sogutma | ic Hava Kalitesi           | url |
      | isitma sogutma | Hava Sogutucu              | url |
      | isitma sogutma | Vantilator                 | url |
      | isitma sogutma | Nem Alma Cihazi            | url |
      | isitma sogutma | Tum Urunler                | url |



      | KEA            | Elektrikli Supurge         | url |
      | KEA            | Utu                        | url |
      | KEA            | Kahve Makinesi             | url |
      | KEA            | Cay Makinesi               | url |
      | KEA            | Semaver                    | url |
      | KEA            | Kettle                     | url |
      | KEA            | Kati Meyve Sikacagi        | url |
      | KEA            | Narenciye Sikacagi         | url |
      | KEA            | Karistirici Dograyici      | url |
      | KEA            | Pisirici                   | url |
      | KEA            | Kisisel Bakim              | url |
      | KEA            | Uv Temizleme Cihazi        | url |
      | KEA            | Outdoor Ekipman            | url |
      | KEA            | Tum Urunler                | url |



