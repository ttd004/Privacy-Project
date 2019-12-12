//
//  ProtectedGallery.swift
//  Privacy Project
//
//  Created by Timothy/Ammar/Chandra on 12/2/19.
//  Copyright © 2019 PETS. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class PrivateGallery: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    //Image UI code
    @IBOutlet var imageCollection: UICollectionView!
    {
        didSet{
            imageCollection.dataSource = self
            imageCollection.delegate = self as? UICollectionViewDelegate
        }
    }
    
    /*
    @IBOutlet weak var imageCollection: UICollectionView!
    {
        didSet{
            imageCollection.dataSource = self
            imageCollection.delegate = self as? UICollectionViewDelegate
            
        }
    }
    */
    var images = [UIImage]()
    var Image : UIImage!
    
    //Executed upon view controller being segued to
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadImages()
    }
    
    //Append input images
    func loadImages(){
        //images.append(UIImage(named: "image1")!)
        if Image != nil{
            images.append(Image)
        }

        self.imageCollection.reloadData()
    }
    
    @IBAction func GoToMainMenu(_ sender: Any) {
        
    }
    
    //Prepare the image for transferring (seguing) to other view controller(s)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ViewController
        vc.images = images
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // In this function is the code you must implement to your code project if you want to change size of Collection view
        //let width  = (view.frame.width-20)/3
        //return CGSize(width: width, height: width)
        return CGSize(width: CGFloat((collectionView.frame.size.width / 4) - 1), height: CGFloat(100)+1)
    }
    
    //Collection view of images
    func collectionView(_ imageCollection: UICollectionView, numberOfItemsInSection section: Int)-> Int{
        return images.count
    }
    
    //Input images into cell
    func collectionView(_ imageCollection: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = imageCollection.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ImageCollectionViewCell
        
        cell.contentView.frame = cell.bounds
        cell.contentView.autoresizingMask = UIView.AutoresizingMask(rawValue: UIView.AutoresizingMask.flexibleLeftMargin.rawValue |
            UIView.AutoresizingMask.flexibleWidth.rawValue |
            UIView.AutoresizingMask.flexibleRightMargin.rawValue |
            UIView.AutoresizingMask.flexibleTopMargin.rawValue |
            UIView.AutoresizingMask.flexibleHeight.rawValue |
            UIView.AutoresizingMask.flexibleBottomMargin.rawValue)
        
        let image = images[indexPath.row]
        cell.imageView.image = image;
        
        return cell
    }
}