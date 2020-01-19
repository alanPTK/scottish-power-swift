//
//  TrackListViewController.swift
//  Scottish Power Tech Test
//
//  Created by Alan Filipe Cardozo Fabeni on 17/01/20.
//  Copyright © 2020 Alan Filipe Cardozo Fabeni. All rights reserved.
//

import UIKit

class TrackListViewController: UIViewController {

    @IBOutlet weak var aiLoadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tvTracks: UITableView!
    @IBOutlet weak var lbLoadingMessage: UILabel!
    
    private var presenter: TrackListPresenter?
    private var selectedTrack: TrackViewModel?
    private lazy var tracks: [TrackViewModel] = [TrackViewModel]()
    private lazy var emptyView = UINib(nibName: Constants.VIEWS.EmptyView, bundle: nil)
    private var showEmptyViewIfNeeded = false
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initObjects()
        
        customizeViewStyle()
    }
    
    /* Initialize the objects used by the view controller */
    func initObjects() {
        presenter = TrackListPresenter(delegate: self)
        presenter?.loadTracks()
    }
    
    /* Customize the view visual style */
    func customizeViewStyle() {
        view.backgroundColor = UIColor.backgroundColor()
        
        let backItem = UIBarButtonItem()
        backItem.title = NSLocalizedString("Back", comment: "")
        navigationItem.backBarButtonItem = backItem
        
        tvTracks.separatorColor = .clear
        aiLoadingIndicator.color = UIColor.institutionalGreenColor()
        lbLoadingMessage.textColor = UIColor.institutionalGreenColor()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.SEGUES.SegueToTrackDetail {
            let trackDetailViewController = segue.destination as! TrackDetailViewController
            trackDetailViewController.selectedTrack = selectedTrack
        }
    }

}

extension TrackListViewController: TrackListDelegate {
    
    /* Reload the table view with the server tracks */
    func showTracks(tracks: [TrackViewModel]) {
        self.tracks = tracks
        showEmptyViewIfNeeded = true
        tvTracks.reloadData()
    }
    
    /* Perform the segue to the detail view with the selected track */
    func showDetailFor(selectedTrack track: TrackViewModel) {
        self.selectedTrack = track
        performSegue(withIdentifier: Constants.SEGUES.SegueToTrackDetail, sender: nil)
    }
    
    /* Show the default alert controller with a message */
    func showErrorMessage(message: String) {                
        showSimpleAlert(title: NSLocalizedString("Attention", comment: ""), message: message)
    }
    
    /* Show the indicator view with a message */
    func showLoadingMessage(message: String) {
        lbLoadingMessage.text = message
        lbLoadingMessage.isHidden = false
        aiLoadingIndicator.isHidden = false
        aiLoadingIndicator.startAnimating()
    }
    
    /* Hide the indicator view and the message */
    func hideLoadingMessage() {
        lbLoadingMessage.isHidden = true
        aiLoadingIndicator.isHidden = true
        aiLoadingIndicator.stopAnimating()
    }
    
}

extension TrackListViewController: UITableViewDelegate, UITableViewDataSource {

    /* Check if there's tracks to show. If not, show a view with a message */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.tracks.count == 0 {
            if showEmptyViewIfNeeded {
                if let view = (emptyView.instantiate(withOwner: self, options: nil).first as? EmptyView) {
                    view.ivLogo.isHidden = false
                    view.lbMessage.isHidden = false
                    view.lbMessage.text = NSLocalizedString("No tracks to show. Please, check your internet connection.", comment: "")
                    view.lbMessage.textColor = UIColor.institutionalGreenColor()
                    
                    tvTracks.setEmptyView(emptyView: view)
                }
            }
        } else {
            tvTracks.restore()
        }
        return self.tracks.count
    }
    
    /* Instantiate the cell and show the track content */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let trackCell = tableView.dequeueReusableCell(withIdentifier: Constants.CELLS.trackCellIdentifier, for: indexPath) as! TrackTableViewCell
        let track = tracks[indexPath.row]
        trackCell.loadTrackInformation(track: track)        
        
        return trackCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    /* When the row is selected, get the selected track and send it to the presenter */
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.onSelect(selectedTrack: tracks[indexPath.row])
    }

}
