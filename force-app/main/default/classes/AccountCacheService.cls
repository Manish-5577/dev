public class AccountCacheService {

    // Fully qualified partition name: namespace + partition API name
    private static final String PARTITION_NAME = 'local.firstCache';
    private static final String CACHE_KEY = 'Top10Accounts';
    private static final Integer TTL = 3600; // 1 hour

    public static List<Account> getTopAccounts() {

        // Start timing
        Datetime startTime = System.now();
Datetime startTime24 = System.now();
Datetime startTime33 = System.now();
system.debug('line fetaure cm1')
        // Get the partition object
        Cache.OrgPartition orgPart = Cache.Org.getPartition(PARTITION_NAME);

        // Try reading from cache
        List<Account> accList = (List<Account>) orgPart.get(CACHE_KEY);

        // Check if cache exists
        if (accList == null) {
            System.debug('🔴 CACHE MISS - Querying DB');

            // Query database
            accList = [
                SELECT Id, Name
                FROM Account
                ORDER BY CreatedDate DESC
                LIMIT 100
            ];

            // Store in cache
            orgPart.put(CACHE_KEY, accList, TTL);

            // Confirm cache stored
            Boolean stored = orgPart.contains(CACHE_KEY);
            System.debug('Cache stored successfully? ' + stored);

        } else {
            System.debug('🟢 CACHE HIT - Returning cached data');
        }

        // End timing
        Datetime endTime = System.now();
        Long timeTaken = endTime.getTime() - startTime.getTime();
        System.debug('⏱ Time Taken (ms): ' + timeTaken);

        return accList;
    }

    // Optional: clear cache manually
    public static void clearCache() {
        Cache.OrgPartition orgPart = Cache.Org.getPartition(PARTITION_NAME);
        orgPart.remove(CACHE_KEY);
        System.debug('Cache manually cleared');
    }
}