//
//  ViewController.swift
//  W6D2---StretchyHeader
//
//  Created by Dylan McCrindle on 2016-12-06.
//  Copyright © 2016 Dylan-McCrindle. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
	
	@IBOutlet weak var dateLabel: UILabel!
	@IBOutlet weak var tableView: UITableView!
	@IBOutlet weak var headerView: UIView!
	
	struct NewsItem{
		let world = UIColor.red
 		let americas = UIColor.blue
		let europe = UIColor.green
		let middleEast = UIColor.yellow
		let africa = UIColor.orange
		let asiaPacific = UIColor.purple
	}
	
	let kTableHeaderHeight = 200.0
	
	var newsArray = [(title: String, summary: String)]()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.estimatedRowHeight = 100
		tableView.rowHeight = UITableViewAutomaticDimension
		
		newsArray.append((title: "World", summary: "Climate change protests, divestments meet fossil fuels realities"))
		newsArray.append((title: "Europe", summary: "Scotland's 'Yes' leader says independence vote is 'once in a lifetime'"))
		newsArray.append((title: "Middle East", summary: "Airstrikes boost Islamic State, FBI director warns more hostages possible"))
		newsArray.append((title: "Africa", summary: "Nigeria says 70 dead in building collapse; questions S. Africa victim claim"))
		newsArray.append((title: "Asia Pacific", summary: "Despite UN ruling, Japan seeks backing for whale hunting"))
		newsArray.append((title: "Americas", summary: "Officials: FBI is tracking 100 Americans who fought alongside IS in Syria"))
		newsArray.append((title: "World", summary: "South Africa in $40 billion deal for Russian nuclear reactors"))
		newsArray.append((title: "Europe", summary: "'One million babies' created by EU student exchanges"))
		
		let dateFormatter = DateFormatter()
		dateFormatter.dateStyle = .medium
		dateFormatter.timeStyle = .none
		let dateStr = dateFormatter.string(from: Date())
		dateLabel.text = dateStr
		

		headerView = tableView.tableHeaderView
	    tableView.tableHeaderView = nil
		
		tableView.addSubview(headerView)
		
		tableView.contentInset = UIEdgeInsets(top: CGFloat(kTableHeaderHeight), left: 0, bottom: 0, right:0)
		tableView.contentOffset = CGPoint(x: 0, y: -kTableHeaderHeight)
		updateHeaderView()


	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return newsArray.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cellIdentifier = "myCell"
		let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CustomTableViewCell
		
		let newsColor = NewsItem()
		
		let tuple = newsArray[indexPath.row]
		
		switch tuple.title {
			case "World":
				cell.categoryLabel.textColor = newsColor.world
			case "Americas":
				cell.categoryLabel.textColor = newsColor.americas
			case "Europe":
				cell.categoryLabel.textColor = newsColor.europe
			case "Middle East":
				cell.categoryLabel.textColor = newsColor.middleEast
			case "Africa":
				cell.categoryLabel.textColor = newsColor.africa
			case "Asia Pacific":
				cell.categoryLabel.textColor = newsColor.asiaPacific
			default:
				cell.categoryLabel.textColor = UIColor.white
		}
		
		cell.healineLabel.text = tuple.summary
		cell.categoryLabel.text = tuple.title
		
		return cell
	}
	
	
	func scrollViewDidScroll(_ scrollView: UIScrollView) {
		updateHeaderView()
	}
	
	func updateHeaderView(){
		var headerRect = CGRect(x: 0.0, y: -kTableHeaderHeight, width: Double(tableView.bounds.width), height: kTableHeaderHeight)

		if tableView.contentOffset.y < CGFloat(-kTableHeaderHeight) {
			headerRect.origin.y = tableView.contentOffset.y
			headerRect.size.height = -tableView.contentOffset.y
		}
		
		headerView.frame = headerRect
	}

}

