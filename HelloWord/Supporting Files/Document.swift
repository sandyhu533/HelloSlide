////
////  Document.swift
////  HelloWord
////
////  Created by SandyHu on 2019/10/10.
////  Copyright © 2019 HelloWord. All rights reserved.
////
//
//import UIKit
//
//enum FileError: Error{
//    case invalidData
//}
//
//class Document: UIDocument {
//    
//    var attributedStringArray = [NSAttributedString]()
//    
//    override func contents(forType typeName: String) throws -> Any {
//        // Encode your document with an instance of NSData or NSFileWrapper
//        let data = try NSKeyedArchiver.archivedData(withRootObject: attributedStringArray as Any , requiringSecureCoding: true)
//        return Data(data)
//    }
//    
//    override func load(fromContents contents: Any, ofType typeName: String?) throws {
//        // Load your document from contents
//        guard let contents = contents as? Data else{
//            throw FileError.invalidData
//        }
//        
//        if let attributeArray = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(contents) as? [NSAttributedString]{
//            for oneAttribute in attributeArray{
//                let attribute = NSMutableAttributedString(attributedString: oneAttribute)
//                //枚举出富文本中所有的内容
//                attribute.enumerateAttributes(in: NSRange(location: 0, length: attribute.length), options: [], using: { (data, range, _) in
//                    //找出富文本中的附件
//                    if let attachment = data[.attachment] as? NSTextAttachment {
//                        //取出附件中的图片
//                        let image = (attachment.image)!
//                        //缩放
//                        let scale = 500 / image.size.width
//                        //设置大小
//                        attachment.bounds = CGRect(x: 0, y: 0, width: image.size.width * scale, height: image.size.height * scale)
//                        //替换富文本中的附件
//                        attribute.replaceCharacters(in: range, with: NSAttributedString(attachment: attachment))
//                    }
//                })
//                attributedStringArray.append(attribute)
//            }
//        }
//    }
//}
//
