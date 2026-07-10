public class FinancialForecasting
{
    /*
     * Recursive method to calculate future value
     *
     * Formula: futureValue = presentValue * (1 + growthRate)^years
     *
     * Time Complexity:  O(n) where n = number of years
     * Space Complexity: O(n) due to recursive call stack
     */
    public static double CalculateFutureValue(double presentValue, double growthRate, int years)
    {
        // Base case: no more years to calculate
        if (years == 0)
            return presentValue;

        // Recursive case: apply growth rate for one year, then recurse
        return CalculateFutureValue(presentValue * (1 + growthRate), growthRate, years - 1);
    }

    /*
     * Optimized version using Memoization (avoids repeated calculations)
     *
     * Time Complexity:  O(n) - each subproblem solved only once
     * Space Complexity: O(n) - memo dictionary stores n results
     */
    private static Dictionary<int, double> memo = new Dictionary<int, double>();

    public static double CalculateFutureValueMemo(double presentValue, double growthRate, int years)
    {
        if (years == 0)
            return presentValue;

        if (memo.ContainsKey(years))
            return memo[years];

        double result = CalculateFutureValueMemo(presentValue * (1 + growthRate), growthRate, years - 1);
        memo[years] = result;
        return result;
    }
}
