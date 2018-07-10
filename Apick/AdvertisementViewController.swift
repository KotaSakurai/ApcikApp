//
//  AdvertisementViewController.swift
//  Apick
//
//  Created by 桜井広大 on 2018/07/10.
//  Copyright © 2018年 KotaSakurai. All rights reserved.
//

import UIKit
import Photos

class AdvertisementViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let c = UIImagePickerController()
        present(c, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 「アルバムを開く」ボタン
    func onButtonAlbumOpen(sender: UIButton) {
        var ipc: UIImagePickerController = UIImagePickerController();
        ipc.delegate = self as! UIImagePickerControllerDelegate & UINavigationControllerDelegate
        UIImagePickerControllerSourceType.photoLibrary
        self.present(ipc, animated:true, completion:nil)
    }
    
//    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
//        // アルバム画面を閉じます
//        picker.dismiss(animated: true, completion: nil);
//
//        // 画像をリサイズしてUIImageViewにセット
//        var resizeImage = size(image, width: 480, height: 320)
//        self.image = resizeImage
//        UIImageView.image = resizeImage
//        self.message?.hidden = true
//    }

//    @IBAction func addAdButton(_ sender: Any) {
//        onButtonAlbumOpen
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
