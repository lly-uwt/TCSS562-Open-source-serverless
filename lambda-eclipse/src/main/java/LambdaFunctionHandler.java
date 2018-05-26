

import com.amazonaws.services.lambda.runtime.Context;
import com.amazonaws.services.lambda.runtime.RequestHandler;
import org.apache.commons.math3.util.CombinatoricsUtils;

public class LambdaFunctionHandler implements RequestHandler<Object, String> {

    @Override
    public String handleRequest(Object input, Context context) {
        // context.getLogger().log("Input: " + input);
        long timestamp = System.currentTimeMillis();
        long result = CombinatoricsUtils.factorial(5);
        timestamp = System.currentTimeMillis() - timestamp;
        return result + "," + timestamp;
    }
}
