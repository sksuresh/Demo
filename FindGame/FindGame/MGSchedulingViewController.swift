//
//  MGSchedulingViewController.swift
//  FindGame
//
//  Created by SureshDokula on 24/05/16.
//  Copyright © 2016 MDTMAC. All rights reserved.
//

import UIKit

class MGSchedulingViewController: MGBaseViewController,UITableViewDataSource,UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBarHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        return cell
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 120;
    }
    
   @IBAction func newSchedule(sender:AnyObject){
        let storyBoard = UIStoryboard(name: "Schedule", bundle: NSBundle.mainBundle())
        let event:NewEventViewController? =  storyBoard.instantiateViewControllerWithIdentifier("NewEvent") as? NewEventViewController
     self.navigationController?.pushViewController(event!, animated: true)
    
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
