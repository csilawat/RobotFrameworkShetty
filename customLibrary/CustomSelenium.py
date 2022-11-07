# install webdriver-manager from pycharm
import os
import requests
import json
import platform
import PyPDF2

from robot.libraries.BuiltIn import BuiltIn
from selenium.webdriver.firefox import webdriver
from webdriver_manager.chrome import ChromeDriverManager
from webdriver_manager.microsoft import EdgeChromiumDriverManager
from webdriver_manager.firefox import GeckoDriverManager
# from webdriver_manager.safari import SafariDriverManager
import requests
from requests.packages.urllib3.exceptions import InsecureRequestWarning

requests.packages.urllib3.disable_warnings(InsecureRequestWarning)


def get_chromedriver_path():
    os.environ['WDM_SSL_VERIFY'] = '0'
    driver_path = ChromeDriverManager().install()
    # driver_path = ChromeDriverManager().dont_verify_ssl().install()
    os.chmod(driver_path, 0o777)
    return driver_path


def return_driver_instance():
    return BuiltIn().get_library_instance('SeleniumLibrary').driver


def find_platform():
    _platform = platform.system()
    return _platform


def get_idgedriver_path():
    driver_path = EdgeChromiumDriverManager().install()
    os.chmod(driver_path, 0o777)
    return driver_path


def read_pdf(filename):
    pdfFileObj = open(filename, 'rb')
    pdfReader = PyPDF2.PdfFileReader(pdfFileObj)
    print(pdfReader.numPages)
    pageObj = pdfReader.getPage(0)
    print(pageObj.extractText())
    pdfFileObj.close()
    return pageObj.extractText()


def get_gecko_path():
    driver_path = GeckoDriverManager().install()
    os.chmod(driver_path, 0o777)
    return driver_path

def create_profile(path):
    from selenium import webdriver
    fp = webdriver.FirefoxProfile()
    fp.set_preference("browser.download.folderList", 2)
    fp.set_preference("browser.download.manager.showWhenStarting", False)
    fp.set_preference("browser.download.dir", path)
    fp.set_preference("browser.helperApps.neverAsk.saveToDisk", 'application/csv,application/text,application/pdf')
    fp.update_preferences()
    return fp.path
