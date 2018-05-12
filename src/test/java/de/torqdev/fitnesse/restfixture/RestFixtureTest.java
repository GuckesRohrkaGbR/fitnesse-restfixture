package de.torqdev.fitnesse.restfixture;

import fitnesse.junit.JUnitHelper;
import org.junit.Before;
import org.junit.Test;

import java.io.File;
import java.util.Arrays;

import static org.junit.Assert.*;

public class RestFixtureTest {
    private static final String SUITES_ROOT = "src/main/resources/FitNesseRoot/RestTests";
    private static final String WIKI_SUFFIX = ".wiki";
    private static final String SUITE_NAME_PREFIX = "RestTests.";
    private static final String RESOURCES = "src/main/resources";

    private JUnitHelper helper;

    @Before
    public void prepare() {
        helper = new JUnitHelper(
                RESOURCES,
                new File(
                        "target",
                        "fitnesse-junit"
                ).getAbsolutePath()
        );
        helper.setPort(9090);
    }

    @Test
    public void restFixtureTests() throws Exception {
        File folder = new File(SUITES_ROOT);

        File[] files = folder.listFiles(
                (file, name) -> name.endsWith(WIKI_SUFFIX)
        );

        assertNotNull(files);
        for (File file : files) {
            helper.assertSuitePasses(getSuiteName(file));
        }
    }

    private String getSuiteName(File file) {
        return SUITE_NAME_PREFIX + file.getName().replace(WIKI_SUFFIX, "");
    }
}
