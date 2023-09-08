//
//  BuskerManager.swift
//  Buskers
//
//  Created by I3LT-020 on 7/9/23.
//
// Note: If fail to filter, then generate all the buskers
// BuskerManager is like WeatherManager. the busker list is passed into the SwipeView which is like WeatherView


import SwiftUI
import CoreLocation


class BuskerManager {
    
    // filtering happens here
    func getFilteredBuskersList(userLatitude: CLLocationDegrees, userLongitude: CLLocationDegrees) -> [Busker] {
        print("+++ In getFilteredBuskersList")
        var filteredBuskersList:[Busker] = []
        
        let filename = Bundle.main.path(forResource: "buskers", ofType: "txt")!
//        let buskersString = try! String(contentsOfFile: filename)
        let buskersString = loadTextFile(named: filename)

        let allBuskers = getAllBuskers(jsonString: buskersString)
        
        let coordinatesUser = CLLocation(latitude: userLatitude, longitude: userLongitude)
//        var coordinatesUser = CLLocation(latitude: 1.339996, longitude: 103.962299)
        print("userLatitude: ",userLatitude, " userLongitude: ",userLongitude)
        
        for buskerObj in allBuskers {
//            1.353471, 103.944705 -> user
//            1.352796, 103.944202 -> busker
            
//            let coordinatesBusker = CLLocation(latitude: 1.352796, longitude: 103.944202)
            let coordinatesBusker = CLLocation(latitude: buskerObj.location.latitude, longitude: buskerObj.location.longitude)

            var tempDist = (getDistBetweenBuskerUser(userLocation: coordinatesUser, buskerLocation: coordinatesBusker))
            tempDist = tempDist/1000.0
            print("+++ Check tempDist: ", tempDist)
            if (tempDist != 0){
//            if (tempDist <= 20){
                filteredBuskersList.append(buskerObj)
            }
        }
        
        print("+++ Check filteredBuskersList:   ", filteredBuskersList)
        return filteredBuskersList
    }
    
    func getDistBetweenBuskerUser (userLocation: CLLocation, buskerLocation: CLLocation) -> Double{
        // Distance returned is in m
        return userLocation.distance(from: buskerLocation)
    }
    
    //let previewBuskers = loadTextFile(named: "buskers.txt")
    func loadTextFile(named fileName: String) -> String {
        let fileManager = FileManager.default
        let filePath = fileManager.currentDirectoryPath + "/" + fileName
        do {
            let contents = try String(contentsOfFile: filePath)
            return contents
        } catch {
            print("Error reading file: \(error.localizedDescription)")
        }
        return ""
    }

    func getAllBuskers(jsonString: String) -> [Busker] {
        let buskersJson = Data(jsonString.utf8)
        let decoder = JSONDecoder()

        var buskerObjs:[Busker] = []

        do {
            buskerObjs = try decoder.decode([Busker].self, from: buskersJson)
        } catch {
            print(error.localizedDescription)
        }
//        print(buskerObjs)
        return buskerObjs

    }

}

struct Busker: Codable, Identifiable {
    var id: String { name }
    var name: String
    var age: Int
    var profilePicture: String
    var genre: Genre
    var songs: [Artist]
    var location: Location
    var bio: String
    
    struct Genre: Codable {
        var pop: Int
        var rnb: Int
        var indie: Int
        var classical: Int
        var mandopop: Int
        var malay: Int
        var jpop: Int
    }
    
    struct Location: Codable {
        var latitude: Double
        var longitude: Double
        var address: String
        var link: String
    }
    
    struct Artist: Codable, Identifiable {
        var id: String { artist }
        var artist: String
        var imageURL: String
    }
}

var testBuskerManager = BuskerManager().getFilteredBuskersList(userLatitude: 1.353471, userLongitude: 103.944705)
