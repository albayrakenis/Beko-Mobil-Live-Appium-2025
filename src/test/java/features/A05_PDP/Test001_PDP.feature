Feature: Satin Alma Islemleri

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
    And I scroll until find "Filtrele Button" element with action
    And I wait until element to be clickable and click to "Filtrele Button" element
    And I wait until element to be clickable and click to "Stok Durumu" element
    And I wait until element to be clickable and click to "Var Button" element
    And I wait until element to be clickable and click to "Uygula Button" element
    And I scroll until find "Pdp ilk urun" element with action
    And I wait until element to be clickable and click to "Pdp ilk urun" element
#    And I wait until element to be clickable and click to "Sepete At Button" element
#    And I wait "Urun sepete eklendi text" element
#    And I wait until element to be clickable and click to "Sepete Git Button" element
#    When I see "CartPage" page
#    And I wait "Sepet Title" element
#    And I wait "sepetteki urun sayisi text" element
#    And I wait "arti button" element
#    And I wait until element to be clickable and click to "arti button" element
#    And I wait "Sepete Eklenen Urun Text" element
#    And I wait "Sepeti Bosalt" element
    Then I sleep for 4 seconds
#    And I wait "sepetteki urun sayisi text2" element
#    Then I sleep for 3 seconds
#    And I wait "eksi button" element
#    And I wait until element to be clickable and click to "eksi button" element
#    And I wait "sepetteki urun sayisi text" element
    Then I sleep for 3 seconds





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



