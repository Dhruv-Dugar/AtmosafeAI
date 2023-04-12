//
// Delhi_Pollution_Model.swift
//
// This file was automatically generated and should not be edited.
//

import CoreML


/// Model Prediction Input Type
@available(macOS 10.13, iOS 11.0, tvOS 11.0, watchOS 4.0, *)
class Delhi_Pollution_ModelInput : MLFeatureProvider {
    
    /// NO2 as double value
    var NO2: Double
    
    /// CO as double value
    var CO: Double
    
    /// SO2 as double value
    var SO2: Double
    
    /// O3 as double value
    var O3: Double
    
    /// PM10 as double value
    var PM10: Double
    
    var featureNames: Set<String> {
        get {
            return ["NO2", "CO", "SO2", "O3", "PM10"]
        }
    }
    
    func featureValue(for featureName: String) -> MLFeatureValue? {
        if (featureName == "NO2") {
            return MLFeatureValue(double: NO2)
        }
        if (featureName == "CO") {
            return MLFeatureValue(double: CO)
        }
        if (featureName == "SO2") {
            return MLFeatureValue(double: SO2)
        }
        if (featureName == "O3") {
            return MLFeatureValue(double: O3)
        }
        if (featureName == "PM10") {
            return MLFeatureValue(double: PM10)
        }
        return nil
    }
    
    init(NO2: Double, CO: Double, SO2: Double, O3: Double, PM10: Double) {
        self.NO2 = NO2
        self.CO = CO
        self.SO2 = SO2
        self.O3 = O3
        self.PM10 = PM10
    }
    
}


/// Model Prediction Output Type
@available(macOS 10.13, iOS 11.0, tvOS 11.0, watchOS 4.0, *)
class Delhi_Pollution_ModelOutput : MLFeatureProvider {
    
    /// Source provided by CoreML
    private let provider : MLFeatureProvider
    
    /// PM2.5 as double value
    var PM2_5: Double {
        return self.provider.featureValue(for: "PM2.5")!.doubleValue
    }
    
    var featureNames: Set<String> {
        return self.provider.featureNames
    }
    
    func featureValue(for featureName: String) -> MLFeatureValue? {
        return self.provider.featureValue(for: featureName)
    }
    
    init(PM2_5: Double) {
        self.provider = try! MLDictionaryFeatureProvider(dictionary: ["PM2.5" : MLFeatureValue(double: PM2_5)])
    }
    
    init(features: MLFeatureProvider) {
        self.provider = features
    }
}


/// Class for model loading and prediction
@available(macOS 10.13, iOS 11.0, tvOS 11.0, watchOS 4.0, *)
class Delhi_Pollution_Model {
    let model: MLModel
    
    /// URL of model assuming it was installed in the same bundle as this class
    class var urlOfModelInThisBundle : URL {
        let resPath = Bundle(for: self).url(forResource: "Delhi_Pollution_Model", withExtension: "mlmodel")!
        return try! MLModel.compileModel(at: resPath)
    }
    
    /**
     Construct Delhi_Pollution_Model instance with an existing MLModel object.
     
     Usually the application does not use this initializer unless it makes a subclass of Delhi_Pollution_Model.
     Such application may want to use `MLModel(contentsOfURL:configuration:)` and `Delhi_Pollution_Model.urlOfModelInThisBundle` to create a MLModel object to pass-in.
     
     - parameters:
     - model: MLModel object
     */
    init(model: MLModel) {
        self.model = model
    }
    
    /**
     Construct Delhi_Pollution_Model instance by automatically loading the model from the app's bundle.
     */
    @available(*, deprecated, message: "Use init(configuration:) instead and handle errors appropriately.")
    convenience init() {
        try! self.init(contentsOf: type(of:self).urlOfModelInThisBundle)
    }
    
    /**
     Construct a model with configuration
     
     - parameters:
     - configuration: the desired model configuration
     
     - throws: an NSError object that describes the problem
     */
    @available(macOS 10.14, iOS 12.0, tvOS 12.0, watchOS 5.0, *)
    convenience init(configuration: MLModelConfiguration) throws {
        try self.init(contentsOf: type(of:self).urlOfModelInThisBundle, configuration: configuration)
    }
    
    /**
     Construct Delhi_Pollution_Model instance with explicit path to mlmodelc file
     - parameters:
     - modelURL: the file url of the model
     
     - throws: an NSError object that describes the problem
     */
    convenience init(contentsOf modelURL: URL) throws {
        try self.init(model: MLModel(contentsOf: modelURL))
    }
    
    /**
     Construct a model with URL of the .mlmodelc directory and configuration
     
     - parameters:
     - modelURL: the file url of the model
     - configuration: the desired model configuration
     
     - throws: an NSError object that describes the problem
     */
    @available(macOS 10.14, iOS 12.0, tvOS 12.0, watchOS 5.0, *)
    convenience init(contentsOf modelURL: URL, configuration: MLModelConfiguration) throws {
        try self.init(model: MLModel(contentsOf: modelURL, configuration: configuration))
    }
    
    /**
     Construct Delhi_Pollution_Model instance asynchronously with optional configuration.
     
     Model loading may take time when the model content is not immediately available (e.g. encrypted model). Use this factory method especially when the caller is on the main thread.
     
     - parameters:
     - configuration: the desired model configuration
     - handler: the completion handler to be called when the model loading completes successfully or unsuccessfully
     */
    @available(macOS 11.0, iOS 14.0, tvOS 14.0, watchOS 7.0, *)
    class func load(configuration: MLModelConfiguration = MLModelConfiguration(), completionHandler handler: @escaping (Swift.Result<Delhi_Pollution_Model, Error>) -> Void) {
        return self.load(contentsOf: self.urlOfModelInThisBundle, configuration: configuration, completionHandler: handler)
    }
    
    /**
     Construct Delhi_Pollution_Model instance asynchronously with optional configuration.
     
     Model loading may take time when the model content is not immediately available (e.g. encrypted model). Use this factory method especially when the caller is on the main thread.
     
     - parameters:
     - configuration: the desired model configuration
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    class func load(configuration: MLModelConfiguration = MLModelConfiguration()) async throws -> Delhi_Pollution_Model {
        return try await self.load(contentsOf: self.urlOfModelInThisBundle, configuration: configuration)
    }
    
    /**
     Construct Delhi_Pollution_Model instance asynchronously with URL of the .mlmodelc directory with optional configuration.
     
     Model loading may take time when the model content is not immediately available (e.g. encrypted model). Use this factory method especially when the caller is on the main thread.
     
     - parameters:
     - modelURL: the URL to the model
     - configuration: the desired model configuration
     - handler: the completion handler to be called when the model loading completes successfully or unsuccessfully
     */
    @available(macOS 11.0, iOS 14.0, tvOS 14.0, watchOS 7.0, *)
    class func load(contentsOf modelURL: URL, configuration: MLModelConfiguration = MLModelConfiguration(), completionHandler handler: @escaping (Swift.Result<Delhi_Pollution_Model, Error>) -> Void) {
        MLModel.load(contentsOf: modelURL, configuration: configuration) { result in
            switch result {
            case .failure(let error):
                handler(.failure(error))
            case .success(let model):
                handler(.success(Delhi_Pollution_Model(model: model)))
            }
        }
    }
    
    /**
     Construct Delhi_Pollution_Model instance asynchronously with URL of the .mlmodelc directory with optional configuration.
     
     Model loading may take time when the model content is not immediately available (e.g. encrypted model). Use this factory method especially when the caller is on the main thread.
     
     - parameters:
     - modelURL: the URL to the model
     - configuration: the desired model configuration
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    class func load(contentsOf modelURL: URL, configuration: MLModelConfiguration = MLModelConfiguration()) async throws -> Delhi_Pollution_Model {
        let model = try await MLModel.load(contentsOf: modelURL, configuration: configuration)
        return Delhi_Pollution_Model(model: model)
    }
    
    /**
     Make a prediction using the structured interface
     
     - parameters:
     - input: the input to the prediction as Delhi_Pollution_ModelInput
     
     - throws: an NSError object that describes the problem
     
     - returns: the result of the prediction as Delhi_Pollution_ModelOutput
     */
    func prediction(input: Delhi_Pollution_ModelInput) throws -> Delhi_Pollution_ModelOutput {
        return try self.prediction(input: input, options: MLPredictionOptions())
    }
    
    /**
     Make a prediction using the structured interface
     
     - parameters:
     - input: the input to the prediction as Delhi_Pollution_ModelInput
     - options: prediction options 
     
     - throws: an NSError object that describes the problem
     
     - returns: the result of the prediction as Delhi_Pollution_ModelOutput
     */
    func prediction(input: Delhi_Pollution_ModelInput, options: MLPredictionOptions) throws -> Delhi_Pollution_ModelOutput {
        let outFeatures = try model.prediction(from: input, options:options)
        return Delhi_Pollution_ModelOutput(features: outFeatures)
    }
    
    /**
     Make a prediction using the convenience interface
     
     - parameters:
     - NO2 as double value
     - CO as double value
     - SO2 as double value
     - O3 as double value
     - PM10 as double value
     
     - throws: an NSError object that describes the problem
     
     - returns: the result of the prediction as Delhi_Pollution_ModelOutput
     */
    func prediction(NO2: Double, CO: Double, SO2: Double, O3: Double, PM10: Double) throws -> Delhi_Pollution_ModelOutput {
        let input_ = Delhi_Pollution_ModelInput(NO2: NO2, CO: CO, SO2: SO2, O3: O3, PM10: PM10)
        return try self.prediction(input: input_)
    }
    
    /**
     Make a batch prediction using the structured interface
     
     - parameters:
     - inputs: the inputs to the prediction as [Delhi_Pollution_ModelInput]
     - options: prediction options 
     
     - throws: an NSError object that describes the problem
     
     - returns: the result of the prediction as [Delhi_Pollution_ModelOutput]
     */
    @available(macOS 10.14, iOS 12.0, tvOS 12.0, watchOS 5.0, *)
    func predictions(inputs: [Delhi_Pollution_ModelInput], options: MLPredictionOptions = MLPredictionOptions()) throws -> [Delhi_Pollution_ModelOutput] {
        let batchIn = MLArrayBatchProvider(array: inputs)
        let batchOut = try model.predictions(from: batchIn, options: options)
        var results : [Delhi_Pollution_ModelOutput] = []
        results.reserveCapacity(inputs.count)
        for i in 0..<batchOut.count {
            let outProvider = batchOut.features(at: i)
            let result =  Delhi_Pollution_ModelOutput(features: outProvider)
            results.append(result)
        }
        return results
    }
}
