//
//  InternetMasterViewController.swift
//  InternetProject
//
//  Created by Shams, Shahriar on 12/14/18.
//  Copyright © 2018 CTEC. All rights reserved.
//

import UIKit

class InternetMasterViewController: UITableViewController
{
    private weak var internetDetail : InternetDetailViewController? = nil
    private lazy var internetTopics : [String] = [String]()
    private lazy var addresses : [String] = [String]()
    
    private func setupDetailContents() -> Void
    {
        internetTopics = [
        "Internet Definitions 😀",
        "Standard Search Engine 😃",
        "Ap CSP 😎",
        "Canyons District 🤨",
        "CTEC 🤪",
        "Social Media 😭"
        ]
        
        addresses = [
        "https://www.google.com",
        "https://www.google.com",
        "https://www.google.com",
        "https://www.google.com",
        "https://www.google.com",
    ]
        
        if let splitView = splitViewController
        {
            let currentControllers = splitView.viewControllers
            internetDetail = currentControllers[0] as? InternetDetailViewController
        }
        
    }

  public override func viewDidLoad() -> Void
  {
        super.viewDidLoad()
    
    setupDetailContents()
    self.clearSelectionOnViewWillAppear = false
    
    if let split = splitViewController
    {
        let controllers = split.viewControllers
        internetDetail = (controllers[controllers.count-1] as! UINavigationController).topViewController as? InternetDetailViewController
    }
    
    public override func viewWillAppear(_ animated Bool) -> Void
    {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        
        super.viewWillAppear(animated)
        
        
    }
    
    
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return addresses.count
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueRousableCell(withIdentifier: "Cell", for: indexPath)
        
        let rowText = internetTopics[indexPath.row]
        cell.textLabel!.text = rowText
        return cell
    }
    
    public override func tableView(_ tableView: UITableView, didSelectRowAt IndexPath: IndexPath)
    {
        internetDetail?.detailAddress = addresses[indexPath.row]
        internetDetail?.detailTitle = internetTopics[indexPath.row]
        if (internetDetail != nil)
        {
            splitViewController?.showDetailViewController(internetDetail!, sender: nil)
        }
    }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

}
