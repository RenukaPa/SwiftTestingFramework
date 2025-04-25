//
//  TestingSuite.swift
//  DemoTesting
//
//  Created by Renuka Pandey on 04/03/25.
//

import Testing
//STEP 1: Customize a suite’s name

@Suite("Food truck tests") struct FoodTruckTests {
  @Test func foodTruckExists() { } // ✅ OK: The type has an implicit init().
}

/* STEP 2: An initializer may be required
 An initializer may be required
 If a type contains test functions declared as instance methods, it must be possible to initialize an instance of the type with a zero-argument initializer. The initializer may be any combination of:
 1. implicit or explicit
 2. synchronous or asynchronous
 3. throwing or non-throwing
 private, fileprivate, internal, package, or public

 */
