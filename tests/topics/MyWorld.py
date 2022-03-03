import json

from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn
import requests


@library
class MyWorld:

    def __init__(self):
        self.seleniumLibrary = BuiltIn().get_library_instance("SeleniumLibrary")

    @keyword
    def hello_world(self):
        print("Hello form Custom Library ")

        url = "https://h7ryyyn6hk.execute-api.us-east-2.amazonaws.com/dev/trials/-/slots?emailId=Baker@cgi.connect.test"

        payload = {}
        headers = {
            'authority': 'h7ryyyn6hk.execute-api.us-east-2.amazonaws.com',
            'sec-ch-ua': '" Not A;Brand";v="99", "Chromium";v="98", "Microsoft Edge";v="98"',
            'accept': 'application/json, text/plain, */*',
            'sec-ch-ua-mobile': '?0',
            'user-agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.80 Safari/537.36 Edg/98.0.1108.43',
            'sec-ch-ua-platform': '"Windows"',
            'origin': 'http://localhost:3001',
            'sec-fetch-site': 'cross-site',
            'sec-fetch-mode': 'cors',
            'sec-fetch-dest': 'empty',
            'referer': 'http://localhost:3001/',
            'accept-language': 'en-US,en;q=0.9'
        }

        response = requests.request("GET", url, headers=headers, data=payload)

        json_data = response.json()
        users = json.loads(response.text)

        for user in users:
            trialCode = user['trialCode']
            therapy = user['therapy']
            manufacturer = user['manufacturer']
            for slot in user['slots']:
                List = []
                List.append(slot['slotCode'])
                List.append(slot['expirationDate'])

                List.append(manufacturer['name'])
                List.append(therapy)
                List.append(trialCode.strip())
                List.append(slot['status'])
                print(List)

    @keyword
    def click_on_element(self, element):
        self.seleniumLibrary.click_element(element)

    @keyword
    def cart_value_and_click_on_it(self, productList):
        productTitles = self.seleniumLibrary.get_webelements("css.card-title")
        i = 1
        for productTitle in productTitles:
            self.seleniumLibrary.click_element("(//div[@class='card-footer'])[1]/button")

            # print(productList)
            # print(productTitle.text)
            # if productTitle.text in productList:
            #     self.seleniumLibrary.click_element("(//div[@class='card-footer'])[1]/button")

            # i = i + 1

    @keyword
    def readList(self, list):
        print(list)
        for value in list:
            value
