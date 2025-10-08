//
//  ViewController.swift
//  JSON-TableView-GU
//
//  Created by Jaimin Raval on 29/09/25.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var jokesArr:[JokeModel] = []
    var savedJokesArr:[JokeModel] = []
    
    var superheroNames: [String] = [
        "Captain Thunder",
        "Shadow Blade",
        "Aqua Vortex",
        "Flame Phoenix",
        "Iron Sentinel",
        "Mystic Oracle",
        "Storm Rider",
        "Quantum Leap",
        "Neon Ghost",
        "Titan Forge",
        "Echo Mirage",
        "Frostbite",
        "Volt Surge",
        "Earth Shaker",
        "Lunar Eclipse",
        "Solar Flare",
        "Wind Whisper",
        "Cyber Hawk",
        "Venom Strike",
        "Crystal Guardian",
        "Blaze Runner",
        "Phantom Veil",
        "Gravity Master",
        "Radiant Star",
        "Thunderclap",
        "Ice Warden",
        "Shadow Weaver",
        "Plasma Bolt",
        "Rock Titan",
        "Aero Glide",
        "Bio Lumina",
        "Warp Speed",
        "Ember Knight",
        "Astral Voyager",
        "Pulse Wave",
        "Terra Form",
        "Nova Burst",
        "Specter Drift",
        "Bolt Fury",
        "Aqua Sentinel",
        "Flame Warden",
        "Steel Vortex",
        "Mystic Flame",
        "Storm Oracle",
        "Quantum Shadow",
        "Neon Phoenix",
        "Titan Surge",
        "Echo Frost",
        "Volt Phoenix",
        "Earth Mirage"
    ]

    var superPowers: [String] = [
        "Control lightning and thunder",
        "Manipulate shadows for stealth",
        "Command water and create whirlpools",
        "Generate and control fire",
        "Super strength and metal armor",
        "Predict future events",
        "Ride storms and control wind",
        "Teleport through dimensions",
        "Invisibility and energy bursts",
        "Forge weapons from any material",
        "Create illusions with sound",
        "Freeze objects and enemies",
        "Generate electricity",
        "Cause earthquakes",
        "Control moonlight for healing",
        "Harness solar energy",
        "Communicate with winds",
        "Hack technology with mind",
        "Poisonous strikes and agility",
        "Form crystal shields",
        "Run at supersonic speeds with fire",
        "Phase through objects",
        "Manipulate gravity fields",
        "Emit healing light",
        "Create sonic booms",
        "Form ice barriers",
        "Weave shadows into traps",
        "Shoot plasma projectiles",
        "Control rocks and earth",
        "Fly with aerodynamic precision",
        "Glow with bioluminescent energy",
        "Bend time for speed",
        "Wield flaming swords",
        "Travel through astral planes",
        "Emit electromagnetic pulses",
        "Reshape terrain",
        "Explode with stellar energy",
        "Drift as a ghostly entity",
        "Unleash furious lightning bolts",
        "Guard with water shields",
        "Wield eternal flames",
        "Create steel tornadoes",
        "Cast mystical fire spells",
        "Summon storm visions",
        "Shift quantum shadows",
        "Glow with neon rebirth",
        "Surge with titanic power",
        "Freeze echoes of sound",
        "Rise with electric flames",
        "Form illusory landscapes"
    ]
    
    
    @IBOutlet weak var MyDataTable: UITableView!
    
    
    override func viewWillAppear(_ animated: Bool) {
        //  Fetching JSON data from our func
        jokesArr = JsonServices.shared.readJSON(filename: "LocalJson")
        // Remember to update UI on main thread ALWAYS
        DispatchQueue.main.async { [self] in
            MyDataTable.reloadData()
        }
    }
        
        
    override func viewDidLoad() {
        super.viewDidLoad()
        MyDataTable.dataSource = self
        MyDataTable.delegate = self
        MyDataTable.register(UINib(nibName: "MyDataCell", bundle: nil), forCellReuseIdentifier: "MyDataCell")

    }
    
    //    Save Btn Action func
    @IBAction func savedBtnTapped(_ sender: UIBarButtonItem) {
        
    }
    
    
    //    MARK: - TableView's Protocol methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jokesArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyDataCell") as! MyDataCell
        cell.setupLbl.text = jokesArr[indexPath.row].setup
        cell.punchLbl.text = jokesArr[indexPath.row].punchline
        cell.typeLbl.text = jokesArr[indexPath.row].type
        cell.idLbl.text = "\(jokesArr[indexPath.row].id)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160.0
    }
    
    
    //    MARK: - Swipe action protocols:
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let saveAction = UIContextualAction(style: .normal, title: "Favourite", handler: { [self] action, view, completionHandler in
            savedJokesArr.append(jokesArr[indexPath.row])
            
            completionHandler(true)
        })
        let leadingConfig = UISwipeActionsConfiguration(actions: [saveAction])
        
        return leadingConfig
    }
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delAction = UIContextualAction(style: .destructive, title: "Delete") { [self] action, view, completionHandler in
            jokesArr.remove(at: indexPath.row)
            MyDataTable.deleteRows(at: [indexPath], with: .automatic)
            completionHandler(true)
        }
        delAction.image = UIImage(systemName: "trash")
        delAction.backgroundColor = .red
        let trailingConfig = UISwipeActionsConfiguration(actions: [delAction])
        trailingConfig.performsFirstActionWithFullSwipe = false
        
        return trailingConfig
    }


}

