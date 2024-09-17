package commons;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.testng.annotations.BeforeMethod;

import java.util.HashMap;
import java.util.Map;

public class MyDriver extends BaseTest{
   public static  WebDriver myDriver;
   public  static Map<String,String> globalVariables=new HashMap<>();

    public static WebDriver getMyDriver() {
        return myDriver;
    }

    public static void setMyDriver(WebDriver driver) {
       myDriver = driver;
    }

}
