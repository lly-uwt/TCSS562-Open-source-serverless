
import com.amazonaws.services.lambda.runtime.Context;
import com.amazonaws.services.lambda.runtime.RequestHandler;

import java.util.Random;

import org.apache.commons.math3.util.CombinatoricsUtils;

public class LambdaFunctionHandler implements RequestHandler<Object, String> {
	public static int MAX = 10000;

	@Override
	public String handleRequest(Object input, Context context) {
		Random rn = new Random();
		// context.getLogger().log("Input: " + input);
		long timestamp = System.currentTimeMillis();

		for (int i = 0; i < MAX; i++) {
			for (int j = 0; j < MAX; j++) {
				CombinatoricsUtils.factorial(rn.nextInt(10) + 1);
			}
		}
		timestamp = System.currentTimeMillis() - timestamp;
		return "" + timestamp;
	}
}
