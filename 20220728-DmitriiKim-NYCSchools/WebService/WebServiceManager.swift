//
//  WebServiceManager.swift
//  20220728-DmitriiKim-NYCSchools
//
//  Created by Mitya Kim on 7/28/22.
//

import Foundation

class WebServiceManager {
    
    static let baseUrl = URL(string: "https://data.cityofnewyork.us/resource/s3k6-pzi2.json")
    static let baseURLDetailsSAT = URL(string: "https://data.cityofnewyork.us/resource/f9bf-2cp4.json")
    
    static func fetchAllSchools(completion: @escaping (Result<[School], NetworkError>) -> ()) {
       
        guard let baseURL = baseUrl else { return completion(.failure(.invalidURL)) }
        
        URLSession.shared.dataTask(with: baseURL) { data, _, error in
            
            if let error = error {
                return completion(.failure(.thrownError(error)))
            }
            
            guard let data = data else { return completion(.failure(.noData)) }
                
            do {
                let schools = try JSONDecoder().decode([School].self, from: data)
                return completion(.success(schools))
            } catch {
                return completion(.failure(.unableToDecode))
            }
        }.resume()
    }
    
    static func fetchSchoolDetails(dbn: String, completion: @escaping (Result<SchoolSAT, NetworkError>) -> ()) {
        
        guard let baseURLDetailsSAT = baseURLDetailsSAT else { return completion(.failure(.invalidURL)) }
        
        URLSession.shared.dataTask(with: baseURLDetailsSAT) { data, _, error in
            if let error = error {
                return completion(.failure(.thrownError(error)))
            }
            
            guard let data = data else { return completion(.failure(.noData)) }
            
            do {
                let schoolArray = try JSONDecoder().decode([SchoolSAT].self, from: data)
                let schoolDetails = schoolArray.filter { school in
                     return  dbn == school.dbn
                }
                guard let details = schoolDetails.first else { return }
                return completion(.success(details))
            } catch {
                return completion(.failure(.unableToDecode))
            }
        }.resume()
    }
}

