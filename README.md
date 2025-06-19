
# 🧪 WitnessAI-Assessment - Postman Collection

This Postman collection is designed to test the [Rick and Morty API](https://rickandmortyapi.com/) with various test cases, including valid, invalid, pagination, and filter scenarios. It supports both **positive and negative** tests for characters, pagination, multiple ID fetches, and filters.
Use WitnessAI-Assessment.postman_collection from Collections folder.

---

## 📁 Collection Structure

```
WitnessAI-Assessment
├── Characters
│   ├── GetSingleCharacter
│   ├── GetAllCharacters
│   ├── GetMultipleCharacters
│   ├── Pagination
│   └── FilterCharacters
├── Episodes
│   ├── GetAllEpisodes
│   ├── GetSpecificEpisode
│   ├── Filters
│   └── FilterCharacters
├── Locations
│   ├── GetSingleLocation
│   ├── GetAllLocations
│   ├── GetMultipleLocations
│   ├── Pagination
│   └── FilterLocation
└── APIResources
```

---

## ✅ Features

### 1. **GetSingleCharacter**
- Valid character by ID
- Invalid ID (negative)
- Invalid ID type (e.g., decimal)

### 2. **GetAllCharacters**
- Checks status `200`
- Validates pagination metadata
- Confirms sorted order of character IDs

### 3. **Pagination**
- Tests middle page and end page behavior
- Validates `prev` and `next` links in metadata

### 4. **GetMultipleCharacters**
- Valid IDs (e.g., `[1,183]`)
- Invalid IDs (e.g., `[999999]`)
- Large list (e.g., `1–182`)

### 5. **FilterCharacters**
- Uses query params: `name`, `status`, `species`, `type`, `gender`
- Supports both positive and negative test data
- Validates empty result for invalid filters (e.g., `status=zombie`)

---

## 🧾 Setup

### 🔧 Variables

Define these collection/environment variables:

| Variable            | Example Value           |
|---------------------|--------------------------|
| `Host`              | `rickandmortyapi.com`    |
| `CharacterId`       | Used in dynamic requests |
| `RandomPageAccess`  | Page number for pagination tests |

---

## ▶️ How to Run

### 🏃 In Postman
1. Import the collection.
2. Set environment or collection variables.
3. (For filters) Use **Collection Runner** with a data file like `testData.json`.

### 🖥️ In Newman (CLI)
```bash
newman run WitnessAI-Assessment.postman_collection.json --iteration-data testData.json
```

---

## 📄 Sample `testData.json` (For FilterCharacters)

```json
[
  {
    "name": "Rick",
    "status": "alive",
    "species": "Human",
    "type": "",
    "gender": "Male"
  },
  {
    "name": "NonExistentCharacter",
    "status": "",
    "species": "",
    "type": "",
    "gender": ""
  },
  {
    "name": "",
    "status": "zombie",
    "species": "Ghost",
    "type": "",
    "gender": "Robot"
  }
]
```

---

## 🧪 Assertions Used

- `Status Code` checks (`200`, `404`)
- Property type validation (e.g., `string`, `integer`)
- Sorting validation via custom utility function
- Dynamic assertions based on data file input

---

## 📌 Notes

- Uses `pm.collectionVariables` to pass dynamic data
- `isSortedById()` is exposed as a global utility for sorting validation
- Invalid requests are expected to return empty `results` or `404`

---

## 🧪 Newman Commands to Run Each Folder

You can run specific folders within the collection using the `--folder` option in Newman:
Sample newman commads are as follows:

```bash
# Run APIResources (Root-level)
newman run WitnessAI-Assessment.postman_collection.json --folder "APIResources"

# Run Characters > GetSingleCharacter (At individual folder level).
newman run Collections/WitnessAI-Assessment.postman_collection.json --folder "GetSingleCharacter" --iteration-data TestData/Characters.json  --environment Config/Production.postman_environment.json   --reporters cli,html --reporter-html-export ./reports/newman-report.html

# Run Characters > GetAllLocations (At Parent Level)
newman run Collections/WitnessAI-Assessment.postman_collection.json --folder "GetAllLocations"  --environment Config/Production.postman_environment.json   --reporters cli,html --reporter-html-export ./reports/newman-report.html

```

> 📌 Folder names are case-sensitive and must match the collection exactly.
