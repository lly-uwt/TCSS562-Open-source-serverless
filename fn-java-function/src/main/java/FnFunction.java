import org.apache.commons.math3.util.CombinatoricsUtils;

public class FnFunction {

    public String handleRequest(String input) {
        // String name = (input == null || input.isEmpty()) ? "world"  : input;
        long timestamp = System.currentTimeMillis();
        long result = CombinatoricsUtils.factorial(5);
        timestamp = System.currentTimeMillis() - timestamp;
        return result + "," + timestamp;
    }
}