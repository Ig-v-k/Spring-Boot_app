package testCodes;

import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class CodeWarsTest {

    private int solve(final String digits) {
        if(digits.length() > 5) {
            int a = 0;
            int b = 0;
            int g = 0;
            for(int i = 5; i <= digits.length(); i++, g++) {
                b = Integer.parseInt(digits.substring(g, i));
                if (b > a)
                    a = b;
            }
            return a;
        }
        return 0;
    }

    @Test
    public void exampleTest() {
        assertEquals(83910, this.solve("283910"));
        assertEquals(67890 , this.solve("1234567890"));
    }
}
