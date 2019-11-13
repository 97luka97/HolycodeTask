//
//  JSONTests.swift
//  holycodeTask-iosTests
//
//  Created by Kostic on 11/12/19.
//  Copyright © 2019 Kostic. All rights reserved.
//

import XCTest
@testable import holycodeTask_ios

class JSONTests: XCTestCase {

    override func setUp() {
        

    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_shouldReturnEqualValues() {
        
        let json = """
        {
                "gender": "female",
                "name": {
                    "title": "Mrs",
                    "first": "کیمیا",
                    "last": "کریمی"
                },
                "location": {
                    "street": {
                        "number": 6486,
                        "name": "دکتر فاطمی"
                    },
                    "city": "بجنورد",
                    "state": "تهران",
                    "country": "Iran",
                    "postcode": 12964,
                    "coordinates": {
                        "latitude": "32.7861",
                        "longitude": "123.8048"
                    },
                    "timezone": {
                        "offset": "+1:00",
                        "description": "Brussels, Copenhagen, Madrid, Paris"
                    }
                },
                "email": "khymy.khrymy@example.com",
                "login": {
                    "uuid": "ed87a433-0cb2-4009-859f-2754404a9139",
                    "username": "yellowcat497",
                    "password": "mother",
                    "salt": "YQkcaMXu",
                    "md5": "ffc40d951c09b9c6483c66513dd31d0d",
                    "sha1": "ad9d34715412e4ba9ba283f2f518051f325aecf9",
                    "sha256": "88592fd02e3441e6de30af4d35225feb144284d05274f7bfec11447e6bd05664"
                },
                "dob": {
                    "date": "1964-01-20T03:18:15.692Z",
                    "age": 55
                },
                "registered": {
                    "date": "2007-08-14T23:27:04.086Z",
                    "age": 12
                },
                "phone": "002-66026934",
                "cell": "0949-927-9944",
                "id": {
                    "name": "",
                    "value": null
                },
                "picture": {
                    "large": "https://randomuser.me/api/portraits/women/29.jpg",
                    "medium": "https://randomuser.me/api/portraits/med/women/29.jpg",
                    "thumbnail": "https://randomuser.me/api/portraits/thumb/women/29.jpg"
                },
                "nat": "IR"
        }
        """.data(using: .utf8)!
        let decoder = JSONDecoder()
        
        let userDecoded = try! decoder.decode(User.self, from: json)
        let name = Name(firstName: "Jack",
                        lastName: "Sparow",
                        title: "Mr")
        
        let dob = Dob(date: "01.01.0001",
                      age: 1000)
        
        let picture = Picture(large: URL(string: "https://randomuser.me/api/portraits/thumb/women/29.jpg")!,
                              medium: URL(string: "dummyUrl.com")!,
                              thumbnail: URL(string: "google.cok")!)
        
    
        let userForTest = User(name: name, dob: dob, picture: picture, email: "luka@test.net", gender: "male", nat: "IR")
        
        XCTAssertFalse(userDecoded.name.firstName == "test")
        XCTAssertNotNil(userDecoded.dob.age)
        XCTAssertNotEqual(userDecoded, userForTest)
    }

}



