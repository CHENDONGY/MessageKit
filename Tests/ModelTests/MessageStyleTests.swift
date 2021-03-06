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

class MessageStyleTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testTailCornerImageOrientation() {
        XCTAssertEqual(MessageStyle.TailCorner.bottomRight.imageOrientation, UIImageOrientation.up)
        XCTAssertEqual(MessageStyle.TailCorner.bottomLeft.imageOrientation, UIImageOrientation.upMirrored)
        XCTAssertEqual(MessageStyle.TailCorner.topLeft.imageOrientation, UIImageOrientation.down)
        XCTAssertEqual(MessageStyle.TailCorner.topRight.imageOrientation, UIImageOrientation.downMirrored)
    }

    func testTailStyleImageNameSuffix() {
        XCTAssertEqual(MessageStyle.TailStyle.curved.imageNameSuffix, "_tail_v2")
        XCTAssertEqual(MessageStyle.TailStyle.pointedEdge.imageNameSuffix, "_tail_v1")
    }

    func testImageNil() {
        XCTAssertNil(MessageStyle.none.image)
    }

    func testImageBubble() {
        let assetBundle = Bundle.messageKitAssetBundle()
        let imagePath = assetBundle.path(forResource: "bubble_full", ofType: "png", inDirectory: "Images")
        let originalData = UIImagePNGRepresentation(MessageStyle.bubble.image ?? UIImage())
        let testData = UIImagePNGRepresentation(stretch(UIImage(contentsOfFile: imagePath!)!).withRenderingMode(.alwaysTemplate))
        XCTAssertEqual(originalData, testData)
    }

    func testImageBubbleOutline() {
        let assetBundle = Bundle.messageKitAssetBundle()
        let imagePath = assetBundle.path(forResource: "bubble_outlined", ofType: "png", inDirectory: "Images")
        let originalData = UIImagePNGRepresentation(MessageStyle.bubbleOutline(.black).image ?? UIImage())
        let testData = UIImagePNGRepresentation(stretch(UIImage(contentsOfFile: imagePath!)!).withRenderingMode(.alwaysTemplate))
        XCTAssertEqual(originalData, testData)
    }

    func testImageBubbleTailCurved() {
        let assetBundle = Bundle.messageKitAssetBundle()
        let imagePath = assetBundle.path(forResource: "bubble_full_tail_v2", ofType: "png", inDirectory: "Images")

        var originalData = UIImagePNGRepresentation(MessageStyle.bubbleTail(.bottomLeft, .curved).image ?? UIImage())
        var testData =  UIImagePNGRepresentation(stretch(transform(image: UIImage(contentsOfFile: imagePath!)!, corner: .bottomLeft)!).withRenderingMode(.alwaysTemplate))
        XCTAssertEqual(originalData, testData)

        originalData = UIImagePNGRepresentation(MessageStyle.bubbleTail(.bottomRight, .curved).image ?? UIImage())
        testData =  UIImagePNGRepresentation(stretch(transform(image: UIImage(contentsOfFile: imagePath!)!, corner: .bottomRight)!).withRenderingMode(.alwaysTemplate))
        XCTAssertEqual(originalData, testData)

        originalData = UIImagePNGRepresentation(MessageStyle.bubbleTail(.topLeft, .curved).image ?? UIImage())
        testData =  UIImagePNGRepresentation(stretch(transform(image: UIImage(contentsOfFile: imagePath!)!, corner: .topLeft)!).withRenderingMode(.alwaysTemplate))
        XCTAssertEqual(originalData, testData)

        originalData = UIImagePNGRepresentation(MessageStyle.bubbleTail(.topRight, .curved).image ?? UIImage())
        testData =  UIImagePNGRepresentation(stretch(transform(image: UIImage(contentsOfFile: imagePath!)!, corner: .topRight)!).withRenderingMode(.alwaysTemplate))
        XCTAssertEqual(originalData, testData)
    }

    func testImageBubbleTailPointedEdge() {
        let assetBundle = Bundle.messageKitAssetBundle()
        let imagePath = assetBundle.path(forResource: "bubble_full_tail_v1", ofType: "png", inDirectory: "Images")

        var originalData = UIImagePNGRepresentation(MessageStyle.bubbleTail(.bottomLeft, .pointedEdge).image ?? UIImage())
        var testData =  UIImagePNGRepresentation(stretch(transform(image: UIImage(contentsOfFile: imagePath!)!, corner: .bottomLeft)!).withRenderingMode(.alwaysTemplate))
        XCTAssertEqual(originalData, testData)

        originalData = UIImagePNGRepresentation(MessageStyle.bubbleTail(.bottomRight, .pointedEdge).image ?? UIImage())
        testData =  UIImagePNGRepresentation(stretch(transform(image: UIImage(contentsOfFile: imagePath!)!, corner: .bottomRight)!).withRenderingMode(.alwaysTemplate))
        XCTAssertEqual(originalData, testData)

        originalData = UIImagePNGRepresentation(MessageStyle.bubbleTail(.topLeft, .pointedEdge).image ?? UIImage())
        testData =  UIImagePNGRepresentation(stretch(transform(image: UIImage(contentsOfFile: imagePath!)!, corner: .topLeft)!).withRenderingMode(.alwaysTemplate))
        XCTAssertEqual(originalData, testData)

        originalData = UIImagePNGRepresentation(MessageStyle.bubbleTail(.topRight, .pointedEdge).image ?? UIImage())
        testData =  UIImagePNGRepresentation(stretch(transform(image: UIImage(contentsOfFile: imagePath!)!, corner: .topRight)!).withRenderingMode(.alwaysTemplate))
        XCTAssertEqual(originalData, testData)
    }

    func testImageBubbleTailOutlineCurved() {
        let assetBundle = Bundle.messageKitAssetBundle()
        let imagePath = assetBundle.path(forResource: "bubble_outlined_tail_v2", ofType: "png", inDirectory: "Images")

        var originalData = UIImagePNGRepresentation(MessageStyle.bubbleTailOutline(.red, .bottomLeft, .curved).image ?? UIImage())
        var testData =  UIImagePNGRepresentation(stretch(transform(image: UIImage(contentsOfFile: imagePath!)!, corner: .bottomLeft)!).withRenderingMode(.alwaysTemplate))
        XCTAssertEqual(originalData, testData)

        originalData = UIImagePNGRepresentation(MessageStyle.bubbleTailOutline(.red, .bottomRight, .curved).image ?? UIImage())
        testData =  UIImagePNGRepresentation(stretch(transform(image: UIImage(contentsOfFile: imagePath!)!, corner: .bottomRight)!).withRenderingMode(.alwaysTemplate))
        XCTAssertEqual(originalData, testData)

        originalData = UIImagePNGRepresentation(MessageStyle.bubbleTailOutline(.red, .topLeft, .curved).image ?? UIImage())
        testData =  UIImagePNGRepresentation(stretch(transform(image: UIImage(contentsOfFile: imagePath!)!, corner: .topLeft)!).withRenderingMode(.alwaysTemplate))
        XCTAssertEqual(originalData, testData)

        originalData = UIImagePNGRepresentation(MessageStyle.bubbleTailOutline(.red, .topRight, .curved).image ?? UIImage())
        testData =  UIImagePNGRepresentation(stretch(transform(image: UIImage(contentsOfFile: imagePath!)!, corner: .topRight)!).withRenderingMode(.alwaysTemplate))
        XCTAssertEqual(originalData, testData)
    }

    func testImageBubbleTailOutlinePointedEdge() {
        let assetBundle = Bundle.messageKitAssetBundle()
        let imagePath = assetBundle.path(forResource: "bubble_outlined_tail_v1", ofType: "png", inDirectory: "Images")

        var originalData = UIImagePNGRepresentation(MessageStyle.bubbleTailOutline(.red, .bottomLeft, .pointedEdge).image ?? UIImage())
        var testData =  UIImagePNGRepresentation(stretch(transform(image: UIImage(contentsOfFile: imagePath!)!, corner: .bottomLeft)!).withRenderingMode(.alwaysTemplate))
        XCTAssertEqual(originalData, testData)

        originalData = UIImagePNGRepresentation(MessageStyle.bubbleTailOutline(.red, .bottomRight, .pointedEdge).image ?? UIImage())
        testData =  UIImagePNGRepresentation(stretch(transform(image: UIImage(contentsOfFile: imagePath!)!, corner: .bottomRight)!).withRenderingMode(.alwaysTemplate))
        XCTAssertEqual(originalData, testData)

        originalData = UIImagePNGRepresentation(MessageStyle.bubbleTailOutline(.red, .topLeft, .pointedEdge).image ?? UIImage())
        testData =  UIImagePNGRepresentation(stretch(transform(image: UIImage(contentsOfFile: imagePath!)!, corner: .topLeft)!).withRenderingMode(.alwaysTemplate))
        XCTAssertEqual(originalData, testData)

        originalData = UIImagePNGRepresentation(MessageStyle.bubbleTailOutline(.red, .topRight, .pointedEdge).image ?? UIImage())
        testData =  UIImagePNGRepresentation(stretch(transform(image: UIImage(contentsOfFile: imagePath!)!, corner: .topRight)!).withRenderingMode(.alwaysTemplate))
        XCTAssertEqual(originalData, testData)
    }

    private func stretch(_ image: UIImage) -> UIImage {
        let center = CGPoint(x: image.size.width / 2, y: image.size.height / 2)
        let capInsets = UIEdgeInsets(top: center.y, left: center.x, bottom: center.y, right: center.x)
        return image.resizableImage(withCapInsets: capInsets, resizingMode: .stretch)
    }

    private func transform(image: UIImage, corner: MessageStyle.TailCorner) -> UIImage? {
        guard let cgImage = image.cgImage else { return image }
        return UIImage(cgImage: cgImage, scale: image.scale, orientation: corner.imageOrientation)
    }
}
