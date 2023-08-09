public abstract class SObjectService {

    public void insertObject(SObject record) {
        insert record;
    }
    
    public abstract Boolean validateObject(sObject record);
    /**
    *
    *   Filter a list of records based on the input criteria.
    *   For any text field it will check that the field value exactly matches the provided value.
    *   For any “number” field the method will check that the field value is bigger than this value.
    *
    */
    public List<Sobject> filterRecords(List<SObject> records, Map<String, Object> filters) {
        List<SObject> filteredRecords = new List<SObject>();

        for (SObject record : records) {
            Boolean recordMatchesFilters = true;

            for(String fieldName : filters.keySet()) {
                Object filterFieldValue = filters.get(fieldName);
                Boolean isString = filterFieldValue instanceof String;
                Boolean isNumber = filterFieldValue instanceof Integer ||
                                   filterFieldValue instanceof Double ||
                                   filterFieldValue instanceof Decimal ||
                                   filterFieldValue instanceof Long;

                if(isString && (record.get(fieldName) != (String) filterFieldValue) ) {
                    recordMatchesFilters = false;
                    break;
                } else if(isNumber && ((Decimal) record.get(fieldName) < (Decimal) filterFieldValue) ) {
                    recordMatchesFilters = false;
                    break;
                }
            }
            
            if(recordMatchesFilters) {
                filteredRecords.add(record);
            }
        }

        return filteredRecords;
    }
}