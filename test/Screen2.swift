//
//  Screen2.swift
//  test
//
//  Created by ay on 2022/09/30.
//

import UIKit
import PhotosUI

class Screen2: UIViewController, PHPickerViewControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action:#selector(tapped)))
        // Do any additional setup after loading the view.
        
    }
    
    @objc
    func tapped() {
        
        var configuration = PHPickerConfiguration()
        configuration.selectionLimit = 1 // 選択数
        configuration.filter = .images // 写真のみ
        configuration.preferredAssetRepresentationMode = .current // これがないとJPEGが選択できなかった
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = self
        
        present(picker, animated: true)
    }
    
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        //写真が選択された後の処理
        for result in results {
            //resultsから、Imageを取得
            if result.itemProvider.canLoadObject(ofClass: UIImage.self) {
                result.itemProvider.loadFileRepresentation(forTypeIdentifier: UTType.image.identifier) { (url, error) in
                        guard let url = url else {
                            return
                        }
                        guard let imageData = try? Data(contentsOf: url) else {
                            return
                        }

                        DispatchQueue.main.async {
                            self.imageView.image = UIImage(data: imageData)
                        }
                }
                /*
                result.itemProvider.loadObject(ofClass: UIImage.self) { (image, error) in
                    //取得したimageとerrorを使って処理を進める
                    if let image = image as? UIImage {
                        // 選択された画像をimageViewに設定
                        DispatchQueue.main.sync {
                            self.imageView.image = image
                        }
                    } else {
                        print("Error(1)")
                    }
                }
                */
            }
        }
        picker.dismiss(animated: true)
    }

}



