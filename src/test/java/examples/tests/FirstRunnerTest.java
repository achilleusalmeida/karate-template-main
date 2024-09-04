package examples.tests;

import com.intuit.karate.junit5.Karate;

public class FirstRunnerTest {
    @Karate.Test
    Karate testUsers() {
        return Karate.run("first").relativeTo(getClass());
    }
}
