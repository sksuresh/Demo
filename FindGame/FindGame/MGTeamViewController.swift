//
//  MGTeamViewController.swift
//  FindGame
//
//  Created by SureshDokula on 18/06/16.
//  Copyright © 2016 MDTMAC. All rights reserved.
//

import UIKit

class MGTeamViewController: UICollectionViewController {

    var arrImgs:[String] = []
    var arrTeamMembersImgs:[String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden =   true
         arrImgs = ["angry_birds_cake.jpg", "creme_brelee.jpg", "egg_benedict.jpg", "full_breakfast.jpg", "green_tea.jpg", "ham_and_cheese_panini.jpg", "ham_and_egg_sandwich.jpg", "hamburger.jpg"]
        arrTeamMembersImgs  = ["instant_noodle_with_egg.jpg", "japanese_noodle_with_pork.jpg", "mushroom_risotto.jpg", "noodle_with_bbq_pork.jpg", "starbucks_coffee.jpg", "thai_shrimp_cake.jpg", "vegetable_curry.jpg", "white_chocolate_donut.jpg"]
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 2
    }
  override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    if section == 0 {
        return arrImgs.count
    }else {
        return arrTeamMembersImgs.count
    }
    
    }
      override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let collectionViewCell:UICollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("team", forIndexPath: indexPath) as UICollectionViewCell
        let view:UIView = collectionViewCell.viewWithTag(100)!
        let imge:UIImageView = view.subviews[0] as! UIImageView
        if indexPath.section == 0 {
        imge.image = UIImage(named: arrImgs[indexPath.row])
        }else {
            imge.image = UIImage(named: arrTeamMembersImgs[indexPath.row])
        }
        return collectionViewCell
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
