import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

public class TestOne {
    private WebDriver driver;

    @BeforeEach
    void startChrome(){
        System.setProperty("webdriver.chrome.driver", "D:\\driver\\chromedriver.exe");
        driver = new ChromeDriver();
        driver.manage().window().maximize();
    }

    @Test
    void test1(){
        new HomePage(driver).openHomePage().loginSite().openLoginPage().authorization();
    }

    @AfterEach
    void closeChrome(){
        driver.close();
    }
}
