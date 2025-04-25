//
//  DemoTesting1.swift
//  Demo
//
//  Created by Renuka Pandey on 26/02/25.
//

//STEP 0: Import the testing library

import Testing

//STEP 1: Declare a test function

@Test func foodTruckExists1() {
  // Test logic goes here.
}

//STEP 2: Customize a test’s name

@Test("Food truck exists") func foodTruckExists2() { }

//STEP 3: Write concurrent or throwing tests

@Test @MainActor func foodTruckExists3() async throws { }

//STEP 4: Limit the availability of a test

@available(macOS 11.0, *)
@available(swift, introduced: 8.0, message: "Requires Swift 8.0 features to run")
@Test func foodTruckExists4() { }
