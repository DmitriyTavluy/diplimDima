import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

import java.util.concurrent.TimeUnit;

public class LoginPage {
    private WebDriver driver;

    public LoginPage(WebDriver driver) {
        this.driver = driver;
    }

    public LoginPage openLoginPage(){
        driver.manage().timeouts().implicitlyWait(10, TimeUnit.SECONDS);
        WebElement loginButton = driver.findElement(By.xpath(XPath.BUTTON_LOGIN_XPATH));
        loginButton.click();
        return this;
    }

    public LoginPage authorization(){
        driver.manage().timeouts().implicitlyWait(10, TimeUnit.SECONDS);
        WebElement loginLine = driver.findElement(By.xpath(XPath.LOGIN_LINE));
        loginLine.sendKeys("Dmitriy");
        driver.manage().timeouts().implicitlyWait(10, TimeUnit.SECONDS);
        WebElement passwordLine = driver.findElement(By.xpath(XPath.PASSWORD_LINE));
        passwordLine.sendKeys("123");
        driver.manage().timeouts().implicitlyWait(10, TimeUnit.SECONDS);
        WebElement button = driver.findElement(By.xpath(XPath.BUTTON_LOGIN1_XPATH));
        button.click();
        return this;
    }
}
