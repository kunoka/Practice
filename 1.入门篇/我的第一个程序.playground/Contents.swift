//: Playground - noun: a place where people can play

//不带图片的二维码图片
let imageViewIcon1 = UIImageView(frame: CGRectMake(20, 20, 150, 150))
imageViewIcon1.image = createQRForString("http://www.111cn.net",
                                         qrImageName: "")
self.view.addSubview(imageViewIcon1)

//带图片的二维码图片
let imageViewIcon2 = UIImageView(frame: CGRectMake(200, 20, 150, 150))
imageViewIcon2.image = createQRForString("http://www.111cn.net",
                                         qrImageName: "logo")
self.view.addSubview(imageViewIcon2)


//创建二维码图片
func createQRForString(qrString: String?, qrImageName: String?) -> UIImage?{
    if let sureQRString = qrString {
        let stringData = sureQRString.dataUsingEncoding(NSUTF8StringEncoding,
                                                        allowLossyConversion: false)
        // 创建一个二维码的滤镜
        let qrFilter = CIFilter(name: "CIQRCodeGenerator")!
        qrFilter.setValue(stringData, forKey: "inputMessage")
        qrFilter.setValue("H", forKey: "inputCorrectionLevel")
        let qrCIImage = qrFilter.outputImage
        // 创建一个颜色滤镜,黑白色
        let colorFilter = CIFilter(name: "CIFalseColor")!
        colorFilter.setDefaults()
        colorFilter.setValue(qrCIImage, forKey: "inputImage")
        colorFilter.setValue(CIColor(red: 0, green: 0, blue: 0), forKey: "inputColor0")
        colorFilter.setValue(CIColor(red: 1, green: 1, blue: 1), forKey: "inputColor1")
        // 返回二维码image
        let codeImage = UIImage(CIImage: colorFilter.outputImage!
            .imageByApplyingTransform(CGAffineTransformMakeScale(5, 5)))
        // 通常,二维码都是定制的,中间都会放想要表达意思的图片
        if let iconImage = UIImage(named: qrImageName!) {
            let rect = CGRectMake(0, 0, codeImage.size.width, codeImage.size.height)
            UIGraphicsBeginImageContext(rect.size)
            
            codeImage.drawInRect(rect)
            let avatarSize = CGSizeMake(rect.size.width * 0.25, rect.size.height * 0.25)
            let x = (rect.width - avatarSize.width) * 0.5
            let y = (rect.height - avatarSize.height) * 0.5
            iconImage.drawInRect(CGRectMake(x, y, avatarSize.width, avatarSize.height))
            let resultImage = UIGraphicsGetImageFromCurrentImageContext()
            
            UIGraphicsEndImageContext()
            return resultImage
        }
        return codeImage
}