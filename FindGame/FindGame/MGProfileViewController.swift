//
//  MGProfileViewController.swift
//  FindGame
//
//  Created by SureshDokula on 21/05/16.
//  Copyright © 2016 MDTMAC. All rights reserved.
//


import UIKit

class MGProfileViewController: MGBaseViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var records:[String]=["AboutMe","Statistics","Notifications","Acchievements","TeamsPlayed","Schedule","SignOut","Settings"]
    var isGallerySelected = false
    let model = generateRandomData()
    var storedOffsets = [Int: CGFloat]()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBarHidden = true
        tableView.reloadData()
    }
    
    override func viewWillDisappear(animated: Bool) {
        isGallerySelected = false
        super.viewWillDisappear(animated)
    }
    
    @IBAction func GallerySelected(sender: AnyObject) {
        isGallerySelected = true
        tableView.reloadData()
    }
    
    @IBAction func ProfileSelected(sender: AnyObject) {
        isGallerySelected = false
        tableView.reloadData()

    }
    
     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isGallerySelected == true {
        return model.count
        }
        else{
        return records.count
        }
    }
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ProfileCell", forIndexPath: indexPath)
        return cell
    }
    
     func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        guard let tableViewCell = cell as? TableViewCell else { return }
         if isGallerySelected == true {
            tableViewCell.collectionView.hidden = false
        tableViewCell.setCollectionViewDataSourceDelegate(self, forRow: indexPath.row)
        tableViewCell.collectionViewOffset = storedOffsets[indexPath.row] ?? 0
            cell.accessoryType = UITableViewCellAccessoryType.None
            cell.textLabel?.text = ""

        }
         else{
            tableViewCell.collectionView.hidden = true
            cell.textLabel?.text = records[indexPath.row]
            cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator

        }
    }
    
     func tableView(tableView: UITableView, didEndDisplayingCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        guard let tableViewCell = cell as? TableViewCell else { return }
        if isGallerySelected == true {
        storedOffsets[indexPath.row] = tableViewCell.collectionViewOffset
        }
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 150.0
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if isGallerySelected == true{
        return 150.0
        }
        else{
          return UITableViewAutomaticDimension
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if isGallerySelected == false && indexPath.row == 6{
            self.navigationController?.popToRootViewControllerAnimated(true)
        }
    }

}

extension MGProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model[collectionView.tag].count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath)
        
        cell.backgroundColor = model[collectionView.tag][indexPath.item]
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print("Collection view at row \(collectionView.tag) selected index path \(indexPath)")
    }
}
//     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return records.count
//    }
//    
//     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell = tableView .dequeueReusableCellWithIdentifier("ProfileCell")
//        cell?.textLabel?.text = records[indexPath.row]
//        return cell!
//    }


    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
     func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

//}
