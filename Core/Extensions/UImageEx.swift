//  WChat
//
//  Created by Mohamed Adel on 7/4/20.
//  Copyright © 2020 Mohamed Adel. All rights reserved.
//


import UIKit

extension UIImage
{
    func resizeImage(to targetSize: CGSize) -> UIImage
    {
        let size = self.size

        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height

        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio)
        {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        }
        else
        {
            newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
        }

        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)

        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        self.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage!
    }
    
    func getData() -> Data?
    {
        let newImage = resizeImage(to: CGSize(width: 200, height: 200))
        guard let data = newImage.pngData() else { return nil }
        return data
    }
    
    func isEqualToImage(image: UIImage) -> Bool
    {
        let data1 = self.pngData()
        let data2 = image.pngData()
        return data1 == data2
    }
}

