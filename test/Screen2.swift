//
//  Screen2.swift
//  test
//
//  Created by ay on 2022/09/30.
//

import UIKit
import PhotosUI

class Screen2: UIViewController, PHPickerViewControllerDelegate {

    var imageView: UIImageView!
 
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet var scrollView: UIScrollView!
    
    @IBOutlet weak var contentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initImageView()
        
        //スクロールできるサイズをcontentViewの幅と高さに設定
        scrollView.contentSize = contentView.bounds.size
        
    }
    
    //イメージビューをタッチしたら、選択画面が飛び出てくる
    @objc func onTouchImageView(_ sender: UITapGestureRecognizer) {
        if sender.state == .ended{
            
            var configuration = PHPickerConfiguration()
            configuration.selectionLimit = 1 // 選択数
            configuration.filter = .images // 写真のみ
            configuration.preferredAssetRepresentationMode = .current // これがないとJPEGが選択できなかった
            let picker = PHPickerViewController(configuration: configuration)
            picker.delegate = self
        
            present(picker, animated: true)
        }
    }
    
    //onTouchImageViewがされた後に、画像を選択した時の処理
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
                        //イメージビューの画像を更新
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
    
    private func initImageView(){
        // UIImage インスタンスの生成
        let image1:UIImage = UIImage(named:"imagecat")!
        
        // UIImageView 初期化
        self.imageView = UIImageView(image:image1)
        self.imageView.isUserInteractionEnabled = true
        // スクリーンの縦横サイズを取得
        let screenWidth:CGFloat = view.frame.size.width
        let screenHeight:CGFloat = view.frame.size.height
        
        //配置する画像の位置を設定
        let rect:CGRect =
            CGRect(x:0, y:0, width:screenWidth, height:screenHeight/2)
        
        // ImageView frame をCGRectで作った矩形に合わせる
        imageView.frame = rect;
        
        // UIImageViewのインスタンスをビューに追加
        self.scrollView.addSubview(imageView)
        
        //タップした時に画像を選択させる
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTouchImageView(_:))))

    }
}



