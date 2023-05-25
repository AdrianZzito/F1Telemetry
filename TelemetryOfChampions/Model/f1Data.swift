//
//  Data.swift
//  F1Telemetry
//
//  Created by Adrián Castilla on 21/2/23.
//

import Foundation

final class f1Data: ObservableObject {
    
    // MARK: - Sessions
    @Published var session = ["Race", "Qualifying"]
    
    // MARK: - Years
    @Published var year = [/*2023,*/ 2022, 2021, 2020, /*2019, 2018, 2017, 2016, 2015, 2014, 2013, 2012, 2011, 2010, 2009, 2008, 2007, 2006, 2005, 2004, 2003, 2002, 2001, 2000*/]

    // MARK: - Grand Prix
    @Published var grandPrixData = [
        2023:["Bahrain"],
        
        2022:["Bahrain","SaudiArabia","Australia","EmiliaRomagna","Miami","Spain","Monaco","Azerbaijan","Canada","British","Austria","France","Hungary","Belgium","Dutch","Italia","Singapore","Japan","UnitedStates","Mexico","Brazil","AbuDhabi"],
        
        2021:["Bahrain","EmiliaRomagna","Portugal","Spain","Monaco","Azerbaijan","France","Styria","Austria","British","Hungary","Belgium","Dutch","Italia","Russia","Turkey","UnitedStates","Mexico","Brazil","Qatar","SaudiArabia", "AbuDhabi"],
        
        2020:["Austria","Styria","Hungary","British","70thAnniversary","Spain","Belgium","Italia"/*,"Toscana"*/,"Russia","Eifel","Portugal","EmiliaRomagna","Turkey","Bahrain","Sakhir","AbuDhabi"]
    ]
    
    // MARK: - Drivers 2023
    @Published var drivers2023: [Driver] = [
        Driver(name: "VER", year: 2023, team: "redbull"),
        Driver(name: "PER", year: 2023, team: "redbull"),
        Driver(name: "LEC", year: 2023, team: "ferrari"),
        Driver(name: "SAI", year: 2023, team: "ferrari"),
        Driver(name: "HAM", year: 2023, team: "mercedes"),
        Driver(name: "RUS", year: 2023, team: "mercedes"),
        Driver(name: "OCO", year: 2023, team: "alpine"),
        Driver(name: "GAS", year: 2023, team: "alpine"),
        Driver(name: "NOR", year: 2023, team: "mclaren"),
        Driver(name: "PIA", year: 2023, team: "mclaren"),
        Driver(name: "BOT", year: 2023, team: "alfaromeo"),
        Driver(name: "ZHO", year: 2023, team: "alfaromeo"),
        Driver(name: "ALO", year: 2023, team: "astonmartin"),
        Driver(name: "STR", year: 2023, team: "astonmartin"),
        Driver(name: "HUL", year: 2023, team: "haas"),
        Driver(name: "MAG", year: 2023, team: "haas"),
        Driver(name: "TSU", year: 2023, team: "alphatauri"),
        Driver(name: "GAS", year: 2023, team: "alphatauri"),
        Driver(name: "SAR", year: 2023, team: "williams"),
        Driver(name: "ALB", year: 2023, team: "williams"),
    ]
    
    // MARK: - Drivers 2022
    @Published var drivers2022: [Driver] = [
        Driver(name: "VER", year: 2022, team: "redbull"),
        Driver(name: "PER", year: 2022, team: "redbull"),
        Driver(name: "LEC", year: 2022, team: "ferrari"),
        Driver(name: "SAI", year: 2022, team: "ferrari"),
        Driver(name: "HAM", year: 2022, team: "mercedes"),
        Driver(name: "RUS", year: 2022, team: "mercedes"),
        Driver(name: "OCO", year: 2022, team: "alpine"),
        Driver(name: "ALO", year: 2022, team: "alpine"),
        Driver(name: "NOR", year: 2022, team: "mclaren"),
        Driver(name: "RIC", year: 2022, team: "mclaren"),
        Driver(name: "BOT", year: 2022, team: "alfaromeo"),
        Driver(name: "ZHO", year: 2022, team: "alfaromeo"),
        Driver(name: "VET", year: 2022, team: "astonmartin"),
        Driver(name: "STR", year: 2022, team: "astonmartin"),
        Driver(name: "MSC", year: 2022, team: "haas"),
        Driver(name: "MAG", year: 2022, team: "haas"),
        Driver(name: "TSU", year: 2022, team: "alphatauri"),
        Driver(name: "GAS", year: 2022, team: "alphatauri"),
        Driver(name: "LAT", year: 2022, team: "williams"),
        Driver(name: "ALB", year: 2022, team: "williams"),
    ]
    
    // MARK: - Drivers 2021
    @Published var drivers2021: [Driver] = [
        Driver(name: "HAM", year: 2021, team: "mercedes"),
        Driver(name: "BOT", year: 2021, team: "mercedes"),
        Driver(name: "VER", year: 2021, team: "redbull"),
        Driver(name: "PER", year: 2021, team: "redbull"),
        Driver(name: "LEC", year: 2021, team: "ferrari"),
        Driver(name: "SAI", year: 2021, team: "ferrari"),
        Driver(name: "NOR", year: 2021, team: "mclaren"),
        Driver(name: "RIC", year: 2021, team: "mclaren"),
        Driver(name: "OCO", year: 2021, team: "alpine"),
        Driver(name: "ALO", year: 2021, team: "alpine"),
        Driver(name: "TSU", year: 2021, team: "alphatauri"),
        Driver(name: "GAS", year: 2021, team: "alphatauri"),
        Driver(name: "VET", year: 2021, team: "astonmartin"),
        Driver(name: "STR", year: 2021, team: "astonmartin"),
        Driver(name: "LAT", year: 2021, team: "williams"),
        Driver(name: "RUS", year: 2021, team: "williams"),
        Driver(name: "RAI", year: 2021, team: "alfaromeo"),
        Driver(name: "GIO", year: 2021, team: "alfaromeo"),
        Driver(name: "MSC", year: 2021, team: "haas"),
        Driver(name: "MAZ", year: 2021, team: "haas"),
    ]
    
    // MARK: - Drivers 2020
    @Published var drivers2020: [Driver] = [
        Driver(name: "HAM", year: 2020, team: "mercedes"),
        Driver(name: "BOT", year: 2020, team: "mercedes"),
        Driver(name: "VER", year: 2020, team: "redbull"),
        Driver(name: "ALB", year: 2020, team: "redbull"),
        Driver(name: "NOR", year: 2020, team: "mclaren"),
        Driver(name: "SAI", year: 2020, team: "mclaren"),
        Driver(name: "PER", year: 2020, team: "racingpoint"),
        Driver(name: "STR", year: 2020, team: "racingpoint"),
        Driver(name: "OCO", year: 2020, team: "renault"),
        Driver(name: "RIC", year: 2020, team: "renault"),
        Driver(name: "LEC", year: 2020, team: "ferrari"),
        Driver(name: "VET", year: 2020, team: "ferrari"),
        Driver(name: "KVY", year: 2020, team: "alphatauri"),
        Driver(name: "GAS", year: 2020, team: "alphatauri"),
        Driver(name: "RAI", year: 2020, team: "alfaromeo"),
        Driver(name: "GIO", year: 2020, team: "alfaromeo"),
        Driver(name: "GRO", year: 2020, team: "haas"),
        Driver(name: "MAG", year: 2020, team: "haas"),
        Driver(name: "LAT", year: 2020, team: "williams"),
        Driver(name: "RUS", year: 2020, team: "williams"),
    ]
    
}
