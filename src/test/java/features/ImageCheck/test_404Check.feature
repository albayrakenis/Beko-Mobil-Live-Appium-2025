Feature: Check for 404 errors on website links

  @404check @smoke
  Scenario: Verify all links on the website for 404 errors
    Given I am on the homepage
    When I collect all links from the website
    And I check each link for 404 errors
    Then I should see a report of links with 404 errors


























  #@404
  #Scenario Outline: 404 hataları tespit
    #Given I go to url:"https://www.beko.com.tr/"
   # When broken links check "<kategori>" categories and "<Dosya Adi>" file names


    #Examples:
     # | kategori                    | Dosya Adi |
     # | /beyaz-esya                 | 404Check  |
     #| /ankastre                   | 404Check  |
      #| /televizyon                 | 404Check  |
      #| /elektronik                 | 404Check  |
      #| /isitma-sogutma             | 404Check  |
      #| /kucuk-ev-aletleri          | 404Check  |
     # | /hijyen-aksesuar            | 404Check  |
     # | /arcelik-enerji-cozumleri   | 404Check  |
     # | /temizlik-ve-bakim-urunleri | 404Check  |
     # | /su-aritma                  | 404Check  |

