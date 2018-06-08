import java.util.Random;

import org.apache.commons.math3.util.CombinatoricsUtils;

public class FnFunction {
    public static int MAX = 10000;

    public String handleRequest(String input) {
        Random rn = new Random();
        // String name = (input == null || input.isEmpty()) ? "world"  : input;
        long timestamp = System.currentTimeMillis();
        long result = CombinatoricsUtils.factorial(5);
        for (int i = 0; i < MAX; i++) {
			for (int j = 0; j < MAX; j++) {
				CombinatoricsUtils.factorial(rn.nextInt(10) + 1);
			}
		}
		timestamp = System.currentTimeMillis() - timestamp;
		return "" + timestamp;
    }
}