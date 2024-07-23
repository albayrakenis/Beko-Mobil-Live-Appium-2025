package commons;

import io.qameta.allure.Allure;
import io.qameta.allure.model.Status;
import org.json.simple.parser.ParseException;
import org.openqa.selenium.*;
import com.github.javafaker.Faker;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.ui.*;
import org.testng.Assert;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.time.Duration;
import java.util.List;
import java.util.Random;
import java.util.function.Function;

public class CommonLib {

//    public CommonLib(){
//    PageFactory.initElements(Driver);
//    }
    public WebDriver myDriver;
    public WebDriverWait webDriverWait;
    private Parser parser = new Parser();
    private Page mypage;
    public int defaultTimeout = 20;


    public CommonLib(WebDriver driver) {
        myDriver = driver;
        myDriver.manage().timeouts().implicitlyWait(Duration.ofSeconds(defaultTimeout));
        myDriver.manage().timeouts().pageLoadTimeout(Duration.ofSeconds(defaultTimeout));
        webDriverWait = new WebDriverWait(myDriver, Duration.ofSeconds(defaultTimeout));
    }

    public By getElementLocator(String element) {
        By returnLocator = null;
        String elementValue;
        ElementType elemType;
        Element elem = getElementFromJson(element);
        elementValue = elem.getElementValue();
        elemType = elem.getElementType();
        if (elemType != null) {
            switch (elemType.toString()) {
                case "id":
                    returnLocator = By.id(elementValue);
                    break;
                case "xpath":
                    returnLocator = By.xpath(elementValue);
                    break;
                case "className":
                    returnLocator = By.className(elementValue);
                    break;
                case "name":
                    returnLocator = By.name(elementValue);
                    break;
                case "partialLinkText":
                    returnLocator = By.partialLinkText(elementValue);
                    break;
                case "cssSelector":
                    returnLocator = By.cssSelector(elementValue);
                    break;
                case "tagName":
                    returnLocator = By.tagName(elementValue);
                    break;
            }
        }
        return (By) returnLocator;
    }

    public Element getElementFromJson(String elemName) {
        return parser.getElement(mypage.getPageName(), elemName);
    }

    public void seePage(String page) throws IOException, ParseException {
        if (parser.isPageExist(page)) {
            mypage = parser.getPageAttributes(page);

            if (mypage.getWaitElement().length() > 0) {
                waitElement(mypage.getWaitElement());
            } else {
                allureReport(StepResultType.INFO, "there is no waitElement on the page", false);
            }
        } else {

            Assert.fail(page + "page not exist in json file");
        }
    }

    public void ıGoToUrl(String url) {
        try {


            myDriver.navigate().to(url);
            sleep(2);
            allureReport(StepResultType.PASS, "Url opened successfully", true);
        } catch (Exception e) {
            allureReport(StepResultType.FAIL, "Url could not opened successfully", true);
        }

    }

    public void sendKeys(String element, String text) {

        while (text.contains("$")) {

            text = text.replace(text.substring(text.indexOf('$'), text.indexOf("}") + 1), getElementFromGlobalVariables(text.substring(text.indexOf('$')+2, text.indexOf("}"))));

        }

        try {
            myDriver.findElement(getElementLocator(element)).sendKeys(text);
            allureReport(StepResultType.PASS, "Text send text area", true);
        } catch (Exception e) {
            allureReport(StepResultType.FAIL, "Text could not send successfully", true);
        }
    }



    public void sleep(int sec) throws InterruptedException {
        Thread.sleep(1000 * sec);
        allureReport(StepResultType.PASS, "Sleep", false);
    }

    public void clickElementWaitUntilClickable(String element)  {


        WebElement webElement = null;
        String style = "";
        try {
            webElement = webDriverWait.until(ExpectedConditions.elementToBeClickable(getElementLocator(element)));;
            style = webElement.getAttribute("style");
            highLighElement(webElement);
            allureReport(StepResultType.PASS, "Clicked to element.", true);
        } catch (Exception e) {
            allureReport(StepResultType.FAIL, "Could not click to element.", true);
        }
        setDefaultStyle(style, webElement);

        webElement.click();

    }

    public void clickElementWaitUntilClickable2(String element)  {

        webDriverWait.until(new ExpectedCondition<Boolean>() {
            @Override
            public Boolean apply(WebDriver webDriver) {
                return ((JavascriptExecutor)myDriver).executeScript("return document.readyState").equals("complete");
            }
        });


    }
    public void ıAcceptOnBilgilendirmeAndSatisSozlesmesi() throws IOException, ParseException {

        System.out.println("ön bilgilendirme ve satış sözleşmesi");
        seePage("CartPage");

        WebElement onBilgilendirme  = myDriver.findElement(By.id("chk_cart_sum_confirm_1"));
        onBilgilendirme.click();

        WebElement satisSozlemesi = myDriver.findElement(By.id("chk_cart_sum_confirm_2"));
        satisSozlemesi.click();
    }


    public void clickElementWaitUntilClickable(By element) {
        WebElement webElement = null;
        String style = "";
        try {
            webElement = webDriverWait.until(ExpectedConditions.elementToBeClickable(element));
            style = webElement.getAttribute("style");
            highLighElement(webElement);
            allureReport(StepResultType.PASS, "Clicked to element.", true);
        } catch (Exception e) {
            allureReport(StepResultType.FAIL, "Could not click to element.", true);
        }
        setDefaultStyle(style, webElement);
        webElement.click();

    }

    private void setDefaultStyle(String style, WebElement element) {
        JavascriptExecutor js = (JavascriptExecutor) myDriver;
        js.executeScript("arguments[0].setAttribute('style', '" + style + "');", element);
    }

    public String getTextWithJsExecutor(String querySelector) {


        String getTextJS = "function getText() {" +
                "var text=" + querySelector + ";" +
                "return text; }; " +
                "return getText()";


        JavascriptExecutor js = (JavascriptExecutor) myDriver;
        String s = (String) js.executeScript(getTextJS);
        return s;
    }

    public void clickElement(String element) {
        try {
            myDriver.findElement(getElementLocator(element)).click();
            allureReport(StepResultType.PASS, "Clicked to element.", true);
        } catch (Exception e) {
            allureReport(StepResultType.FAIL, "Could not click to element.", true);
        }


    }

    public void waitElementAndCheckVisibility(String element) {
        WebElement webElement = null;
        String style = "";
        try {
            webElement = webDriverWait.until(ExpectedConditions.visibilityOfElementLocated(getElementLocator(element)));
            style = webElement.getAttribute("style");
            highLighElement(webElement);
            allureReport(StepResultType.PASS, element + " Element is found", true);
        } catch (Exception e) {
            allureReport(StepResultType.FAIL, element + " Element is not found", true);
        }
        setDefaultStyle(style, webElement);
    }

    public void waitElement(String element) {
        WebElement webElement = null;
        String style = "";
        try {
            webElement = webDriverWait.until(ExpectedConditions.elementToBeClickable(getElementLocator(element)));
            webElement =  myDriver.findElement(getElementLocator(element));
            style = webElement.getAttribute("style");
            highLighElement(webElement);
            allureReport(StepResultType.PASS, element +"Element is found", true);
        } catch (Exception e) {
            allureReport(StepResultType.FAIL, element +"Element is not found", true);
        }
        setDefaultStyle(style, webElement);
    }

    public void clickKeyboard(String element, String key) {
        WebElement elem = webDriverWait.until(ExpectedConditions.elementToBeClickable(getElementLocator(element)));

        if (key.equalsIgnoreCase("ENTER")) {
            elem.sendKeys(Keys.ENTER);
            allureReport(StepResultType.PASS, "Clicked to " + key, true);
        } else if (key.equalsIgnoreCase("TAB")) {
            elem.sendKeys(Keys.TAB);
            allureReport(StepResultType.PASS, "Clicked to " + key, true);
        }
    }

    public WebElement waitElementAndCheckVisibilityAndReturnElement(String element) {
        WebElement webElement = null;
        try {
            webElement = webDriverWait.until(ExpectedConditions.visibilityOfElementLocated(getElementLocator(element)));
            allureReport(StepResultType.PASS, element + " Element is found", true);
        } catch (Exception e) {
            allureReport(StepResultType.FAIL, element + " Element is not found", true);
        }
        return webElement;
    }

    public boolean checkVisibilityOfElement(String element) {
        WebElement webElement = null;
        Boolean flag=false;
        try {
            webElement = webDriverWait.until(ExpectedConditions.visibilityOfElementLocated(getElementLocator(element)));
            flag=true;
            allureReport(StepResultType.PASS, "'"+element + "' Element is found", true);
        } catch (Exception e) {
            allureReport(StepResultType.INFO, "'"+element + "' Element is not found", true);
        }
        return flag;
    }

    public void saveElementToGlobalVariables(String key, String value) {
        MyDriver.globalVariables.put(key, value);

    }

    public String getElementFromGlobalVariables(String key) {
        return MyDriver.globalVariables.get(key);
    }

    public void ıCheckAlertTextIsEquals(String text) {
        String alertText = myDriver.switchTo().alert().getText();
        if (alertText.equalsIgnoreCase(text)) {
            allureReport(StepResultType.PASS, "", false);
        } else {
            allureReport(StepResultType.FAIL, "text is not equal to '" + text + "'", false);
        }
    }

    public String getAlertText(){
        return myDriver.switchTo().alert().getText();
    }

    public void ıSendKeyToElementTextWithJsexecutor(String text, String elementid) {
        JavascriptExecutor js = (JavascriptExecutor) myDriver;

        System.out.println("document.getElementsById('" + elementid + "').value='" + text + "';");
        js.executeScript("document.getElementById('" + elementid + "').value='" + text + "';");
    }

    public void ıDeleteItemsOnCart() throws IOException, ParseException {
        seePage("HomePage");
        clickElementWaitUntilClickable("sepet icon");
        clickElementWaitUntilClickable("sepeti bosalt");

//        List<WebElement> elementList=myDriver.findElements(By.xpath("//*[@id=\"tbodyid\"]//a[text()=\"Delete\"]"));
//
//        for (WebElement elem:elementList) {
//            clickElementWaitUntilClickable(By.xpath("//*[@id=\"tbodyid\"]//a[text()=\"Delete\"]"));
//        }

        clickElementWaitUntilClickable("anasayfa text");
       // waitElement("categories tab");

    }

    public void highLighElement(WebElement element) {
        JavascriptExecutor js = (JavascriptExecutor) myDriver;
        js.executeScript("arguments[0].setAttribute('style', 'border: 2px solid red;');", element);
    }

    public void ıCheckElementTextIsEqualWithQuerySelector(String text, String selector) {

        if (getTextWithJsExecutor(selector).equalsIgnoreCase(text)) {
            allureReport(StepResultType.PASS, "texts are equal", true);
        } else {
            allureReport(StepResultType.PASS, "texts are not equal", true);
        }
    }

    public void ıCreateAUsernameThatIsAndEndwithNumberBetweenThenSaveUsernameToGlobalvariablesAsAAndThenSignUp(String startWith, int arg1, int arg2, String username) throws InterruptedException {

        Random rnd = new Random();
        boolean flag=false;
        String tempUsername="";
        waitElement("signup modal title");
        waitElement("signup modal username label");
        waitElement("signup modal username input");
        waitElement("signup modal password label");
        waitElement("signup modal password input");
        waitElement("signup modal close button");
        waitElement("signup modal signup button");
        while(!flag){
            tempUsername = startWith + "" + (arg1 + rnd.nextInt(arg2));
            sendKeys("signup modal username input",tempUsername);
            sendKeys("signup modal password input","123");
            clickElementWaitUntilClickable("signup modal signup button");
            sleep(5);
            if(getAlertText().equalsIgnoreCase("Sign up successful.")){
                ıCheckAlertTextIsEquals("Sign up successful.");
                myDriver.switchTo().alert().accept();
                saveElementToGlobalVariables(username,tempUsername);
                flag=true;
            }else if(getAlertText().equalsIgnoreCase("This user already exist.")){
                ıCheckAlertTextIsEquals("This user already exist.");
                myDriver.switchTo().alert().accept();
                waitElementAndCheckVisibilityAndReturnElement("signup modal username input").clear();
                waitElementAndCheckVisibilityAndReturnElement("signup modal password input").clear();
            }
        }
        if(checkVisibilityOfElement("signup modal close button")){
            clickElementWaitUntilClickable("signup modal close button");
        }
    }


    public void ıCreateAAdressThatIsStartAndEndWithNumberBetween(String startWith, int arg1, int arg2) throws InterruptedException {

        Random rnd = new Random();
        boolean flag=false;
        String tempUsername="";
        waitElement("Adres Adi");

            tempUsername = startWith + " " + (arg1 + rnd.nextInt(arg2));
            sendKeys("Adres Adi",tempUsername);

    }

    public void ıCreateAMailThatIsStartAndEndWith(String kullaniciAdi, String uzanti) {
        Random rnd = new Random();
        boolean flag=false;
        String tempUsername="";
        waitElement("Guest email");

        tempUsername = kullaniciAdi+rnd.nextInt(10000)+uzanti;
        sendKeys("Guest email",tempUsername);

        allureReport(StepResultType.PASS, "'"+kullaniciAdi + "' oluşturuldu", true);
    }

    public void ıChooseCityFromList(String City){

//        Select select = new Select( myDriver.findElement(By.cssSelector(".js-click-collect-store #cityCode")));
        Select select = new Select( myDriver.findElement(By.id("cityCode")));
        select.selectByVisibleText(City);

        allureReport(StepResultType.PASS, "'"+City + "' Element is found", true);

    }

    public void ıChooseTownFromList(String Town) {
        Select select = new Select( myDriver.findElement(By.id("townCode")));
        select.selectByVisibleText(Town);
        allureReport(StepResultType.PASS, "'"+Town + "' Element is found", true);
    }

    public void ıChooseNeighborhoodFromList(String Neighborhood) {
        Select select = new Select( myDriver.findElement(By.id("neighborhood")));
        select.selectByVisibleText(Neighborhood);

        allureReport(StepResultType.PASS, "'"+Neighborhood + "' Element is found", true);
    }

    public void ıChooseTaxCityFromList(String TaxCity) {
        Select select = new Select( myDriver.findElement(By.id("taxOffice")));
        select.selectByVisibleText(TaxCity);
        allureReport(StepResultType.PASS, "'"+TaxCity + "' Element is found", true);
    }

    public void ıChooseCityFromListForClickAndCollect(String City) {
        Select select = new Select( myDriver.findElement(By.cssSelector(".js-click-collect-store #cityCode")));

        select.selectByVisibleText(City);
        allureReport(StepResultType.PASS, "'"+City + "' Element is found", true);

    }

    public void ıChooseTownFromListForClickAndCollect(String town) {
        Select select = new Select( myDriver.findElement(By.cssSelector(".js-click-collect-store #townCode")));

        select.selectByVisibleText(town);
        allureReport(StepResultType.PASS, "'"+town + "' Element is found", true);

    }

    public void ıWaitUntilElementToBeClickableAndClickToElementIfElementExist(String element, int timeout) {

        try {


            WebDriverWait wait = new WebDriverWait(myDriver,Duration.ofSeconds(timeout));

//            String element2 = String.valueOf(wait.until(ExpectedConditions.visibilityOfElementLocated(getElementLocator(element))));
            myDriver.findElement(getElementLocator(element)).click();
//            clickElement(element2);
            System.out.println("element bulundu");
            allureReport(StepResultType.PASS, "Clicked to element.", true);
        }catch (Exception e){
            allureReport(StepResultType.INFO,element +"" +element,Boolean.FALSE);
            System.out.println("2");
        }

    }

    public void ıClearTextbox(String arg0) {
        WebElement myelem = myDriver.findElement(getElementLocator(arg0));
        try {
            myelem.clear();
            allureReport(StepResultType.PASS,arg0 + "text is cleared", true);

        }catch (Exception e){
            allureReport(StepResultType.FAIL,arg0 + "text is not cleared", true);
        }
    }

    public void ıSendKeyToElementRandomName(String arg0) {
        Faker faker = new Faker();
        String name="";

        name=faker.name().firstName();
    }

    public String ıSendKeyToElementRandom(String locater, String keys) {
        Faker faker = new Faker();
        allureReport(StepResultType.PASS, "Send to keys", false);


        if (keys != null) {
            switch (keys) {
                case "name":
                    keys = faker.name().firstName();
                    sendKeys(locater,keys);
                    System.out.println(keys);
                    break;
                case "surname":
                    keys = faker.name().lastName();
                    sendKeys(locater,keys);
                    System.out.println(keys);
                    break;
                case "fullname":
                    keys = faker.name().fullName();
                    sendKeys(locater,keys);
                    System.out.println(keys);
                    break;
                case "adress":
                    keys = faker.address().fullAddress();
                    sendKeys(locater,keys);
                    System.out.println(keys);
                    break;
                case "adress name":
                    keys = faker.address().country()+" "+ faker.address().cityName()+faker.number();
                    sendKeys(locater,keys);
                    System.out.println(keys);
                    break;
                case "phone number":
                    int nums =75;
                    keys = nums+ String.valueOf(faker.number().numberBetween(1000000,99999999));
                    sendKeys(locater,keys);
                    System.out.println(keys);
                    break;

            }

            locater=myDriver.findElement(getElementLocator(locater)).getAttribute("value");
            Assert.assertEquals(locater,keys);
            System.out.println(locater);
            allureReport(StepResultType.PASS, "Degistirilen bilgi güncellendi", false);
        }
        return keys;



    }

    public void ıScrollAndClickToElementWithJavascript(String element) {
        try {
            //Locating element by link text and store in variable "Element"
            WebElement webElement = myDriver.findElement(getElementLocator(element));
            JavascriptExecutor js = (JavascriptExecutor) myDriver;
            // Scrolling down the page till the element is found
            js.executeScript("arguments[0].scrollIntoView();", webElement);
            waitElement(element);
            js.executeScript("arguments[0].click();", element);
            allureReport(StepResultType.PASS, "'"+element + "' Element is found and click", true);
        }catch (Exception e){
            allureReport(StepResultType.FAIL,element + "element is not clicable", true);
        }
    }




    public void ıDeleteSavedAdress() throws IOException, ParseException, InterruptedException {
        seePage("HesabimPage");


        List<WebElement> elementList=myDriver.findElements(By.xpath("//a[@data-bdy='msg-opened']"));

        if(elementList.size()>3) {
            int son = elementList.size() - 3;
            for (int i = 0; i < son; i++) {
                clickElementWaitUntilClickable(By.xpath("//div[@class='usr-addresses']/div[1]//a[contains(.,'Sil')]"));
                clickElementWaitUntilClickable(By.xpath("//button[@class='btn btn-outline-dark js-popup-trigger-func']"));
                sleep(3);
            }
        }else {
            System.out.println("yeteri kadar adres yok");
        }



    }

    public void ıScrollUntilFindElementWithAction(String element)  {

        try {
            WebElement webElement = myDriver.findElement(getElementLocator(element));
            Actions actions = new Actions(myDriver);
            actions.scrollToElement(webElement).perform();
            Allure.addAttachment("ScreenShot: Elemente scroll edildi" ,new ByteArrayInputStream(((TakesScreenshot) myDriver).getScreenshotAs(OutputType.BYTES)));
        }catch (Exception e){

            System.out.println("element bulunamadı");
        }

    }


    public void allureReport(StepResultType result, String message, boolean ssFlag) {
        try {
            System.out.println(message);
            if (ssFlag) {
                Allure.addAttachment("ScreenShot: " + message, new ByteArrayInputStream(((TakesScreenshot) myDriver).getScreenshotAs(OutputType.BYTES)));
            }

            if (result.toString().equalsIgnoreCase("PASS")) {
                Allure.step(message, Status.PASSED);
            } else if (result.toString().equalsIgnoreCase("INFO")) {
                Allure.step(message, Status.SKIPPED);
            } else if (result.toString().equalsIgnoreCase("FAIL")) {
                Allure.step(message, Status.FAILED);
                Assert.fail(message);
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
            System.out.println(">>>>>>>>>>>ERROR:CHECK FUNCTION(allureReport)<<<<<<<<<<");
        }
    }
}
