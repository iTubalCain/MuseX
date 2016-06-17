//
//  VideoDetailVC.swift
//  MuseX
//
//  Created by Will on 6/16/16.
//  Copyright © 2016 Will Wagers. All rights reserved.
//

import AVFoundation
import AVKit
import UIKit

class VideoDetailVC: UIViewController {

    @IBOutlet weak var videoImage: UIImageView!
    @IBOutlet weak var detailTitleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var rightsLabel: UILabel!
    
    @IBAction func playVideo(sender: UIBarButtonItem) {
        let playerVC = AVPlayerViewController()
        playerVC.player = AVPlayer(URL: NSURL(string: musicVideo.videoURL)!)
        self.presentViewController(playerVC, animated: true) {
            playerVC.player?.play()
        }
    }
    
    var musicVideo: Video!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(preferredFontChanged), name: UIContentSizeCategoryDidChangeNotification, object: nil)

        //      title = musicVideo.artist
        title = "#\(musicVideo.rank) on iTunes"
        detailTitleLabel.text = musicVideo.title
        artistLabel.text = musicVideo.artist
        genreLabel.text = musicVideo.genre
        priceLabel.text = musicVideo.price
        rightsLabel.text = musicVideo.rights
        if musicVideo.imageData != nil {
            videoImage.image = UIImage(data: musicVideo.imageData!)
        } else {
            videoImage.image = UIImage(contentsOfFile: "imageNotAvailable")
        }
    }

    func preferredFontChanged() {
        // title.font = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
        artistLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
        detailTitleLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
        genreLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
        priceLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
        rightsLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleFootnote)
}

    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIContentSizeCategoryDidChangeNotification, object: nil)
    }

}
