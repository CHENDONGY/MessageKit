/*
 MIT License
 
 Copyright (c) 2017 MessageKit
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
 */

import XCTest
@testable import MessageKit

class AvatarTests: XCTestCase {

    private struct Constants {
        static let defaultInitials = "?"
    }

    func testInitWithoutParams_shouldSetDefaultValuesForImageAndInitials() {
        let sut = Avatar()

        XCTAssertEqual(sut.initals, Constants.defaultInitials)
        XCTAssertNil(sut.image)
    }

    func testInitWithImage_shouldSetImageAndDefaultInitials() {
        let image = UIImage()

        let sut = Avatar(image: image)

        XCTAssertEqual(sut.initals, Constants.defaultInitials)
        XCTAssertEqual(image, sut.image)
    }

    func testInitWithInitials_shouldSetInitialsAndImageNil() {
        let initials = "TI"

        let sut = Avatar(initals: initials)

        XCTAssertEqual( sut.initals, initials)
        XCTAssertNil(sut.image)
    }

    func testInitWithParams_shouldSetImageAndInitials() {
        let initials = "TI"
        let image = UIImage()

        let sut = Avatar(image: image, initals: initials)

        XCTAssertEqual( sut.initals, initials)
        XCTAssertEqual(sut.image, image)
    }

}
