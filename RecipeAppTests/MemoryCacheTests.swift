import Testing
@testable import RecipeApp

struct MemoryCacheTests {
    // MARK: - Tests for String Values
    
    @Test
    func addingAndRetrievingValue() async throws {
        // Given
        let memoryCache = MemoryCache<String, String>()
        let key = "testKey"
        let expectedValue = "testValue"
        
        // When
        memoryCache[key] = expectedValue
        
        // Then
        let retrievedValue = memoryCache[key]
        #expect(retrievedValue == expectedValue, "The retrieved value should match the stored value.")
    }
    
    @Test
    func removingValuesSuccessfully() {
        // Given
        let memoryCache = MemoryCache<String, String>()
        let key = "testKey"
        let value = "testValue"
        
        // When
        memoryCache[key] = value
        
        // Then
        let firstRetrievedValue = memoryCache[key]
        #expect(firstRetrievedValue == value, "The retrieved value should match the stored value.")
        
        // When
        memoryCache[key] = nil
        
        // Then
        let retrievedValue = memoryCache[key]
        #expect(retrievedValue == nil, "The value should be nil after removal.")
    }
    
    @Test
    func updatingValueReplacesExistingValue() {
        // Given
        let memoryCache = MemoryCache<String, String>()
        let key = "testKey"
        let initialValue = "initialValue"
        let updatedValue = "updatedValue"
        
        // When
        memoryCache[key] = initialValue
        
        // Then
        let firstRetrievedValue = memoryCache[key]
        #expect(firstRetrievedValue == initialValue, "The retrieved value should match the stored value.")
        
        // When
        memoryCache[key] = updatedValue
        
        // Then
        let retrievedValue = memoryCache[key]
        #expect(retrievedValue == updatedValue, "The retrieved value should reflect the updated value.")
    }
    
    // MARK: - Tests for Custom Models
    
    @Test
    func addingAndRetrievingCustomModel() {
        // Given
        let memoryCache = MemoryCache<String, MockModel>()
        let key = "modelKey"
        let expectedModel = MockModel(id: 1, name: "Test Model")
        
        // When
        memoryCache[key] = expectedModel
        
        // Then
        let retrievedValue = memoryCache[key]
        #expect(retrievedValue == expectedModel, "The retrieved model should match the stored model.")
    }
    
    @Test
    func updatingCustomModelSuccessfully() {
        // Given
        let memoryCache = MemoryCache<String, MockModel>()
        let key = "modelKey"
        let initialModel = MockModel(id: 2, name: "Initial Model")
        let expectedName = "Updated Model"
        
        // When
        memoryCache[key] = initialModel
        
        // Then
        let firstRetrievedValue = memoryCache[key]
        #expect(firstRetrievedValue == initialModel, "The retrieved model should match the stored value.")
        
        // When
        var updatedModel = memoryCache[key]
        updatedModel?.name = expectedName
        memoryCache[key] = updatedModel
        
        // Then
        let retrievedValue = memoryCache[key]
        #expect(retrievedValue?.name == expectedName, "The retrieved model name should be updated.")
    }
    
    @Test
    func removingCustomModelSuccessfully() {
        // Given
        let memoryCache = MemoryCache<String, MockModel>()
        let key = "modelKey"
        let modelToRemove = MockModel(id: 3, name: "Removable Model")
        
        // When
        memoryCache[key] = modelToRemove
        
        // Then
        let firstRetrievedValue = memoryCache[key]
        #expect(firstRetrievedValue == modelToRemove, "The retrieved model should match the stored value.")
        
        // When
        memoryCache[key] = nil
        
        // Then
        let retrievedValue = memoryCache[key]
        #expect(retrievedValue == nil, "The model should be nil after removal.")
    }
}
