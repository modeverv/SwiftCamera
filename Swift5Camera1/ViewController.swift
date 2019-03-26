//
//  ViewController.swift
//  Swift5Camera1
//
//  Created by seijiro on 2019/03/26.
//  Copyright © 2019 norainu. All rights reserved.
//

import UIKit
import Photos

class ViewController: UIViewController ,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

  @IBOutlet var backImageView: UIImageView!


  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.

    PHPhotoLibrary.requestAuthorization { (status) in
      switch(status) {
      case .authorized: break;
      case .denied: break;
      case .notDetermined: break;
      case .restricted: break;
      }
    }


  }

  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    //if let pickedImage = info[  .originalImage] as? UIImage {
    if let pickedImage = info[.originalImage] as? UIImage {
      backImageView.image = pickedImage
      picker.dismiss(animated: true, completion: nil)
    }
  }

  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    picker.dismiss(animated: true, completion: nil)
  }

  @IBAction func openCamera(_ sender: Any) {
    let sourceType:UIImagePickerController.SourceType = UIImagePickerController.SourceType.camera
    if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
      let cameraPicker =  UIImagePickerController()
      cameraPicker.sourceType = sourceType
      cameraPicker.delegate = self
      self.present(cameraPicker,animated: true,completion: nil)
    }


  }

  @IBAction func openAlbum(_ sender: Any) {
    let sourceType:UIImagePickerController.SourceType = UIImagePickerController.SourceType.photoLibrary
    if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
      let cameraPicker =  UIImagePickerController()
      cameraPicker.sourceType = sourceType
      cameraPicker.delegate = self
      self.present(cameraPicker,animated: true,completion: nil)
     }
  }

  @IBAction func share(_ sender: Any) {
    let text = ""
    let url = NSURL(string: "https://lovesaemi.daemon.asia/")
    let items = [text,url,backImageView.image] as [Any]
    let activityVC = UIActivityViewController(activityItems: items, applicationActivities: nil)
    self.present(activityVC,animated: true,completion: nil)

  }

}

