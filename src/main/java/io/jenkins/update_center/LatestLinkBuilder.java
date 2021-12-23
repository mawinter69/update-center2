package io.jenkins.update_center;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Generates latest/index.html and latest/.htaccess
 *
 * The former lists all the available symlinks, and the latter actually defines the redirects.
 *
 */
public class LatestLinkBuilder implements AutoCloseable {
    private static final Logger LOGGER = Logger.getLogger(LatestLinkBuilder.class.getName());

    private final IndexHtmlBuilder index;

    public LatestLinkBuilder(File dir, IndexTemplateProvider service) throws IOException {
        LOGGER.log(Level.FINE, String.format("Writing plugin symlinks and redirects to dir: %s", dir));

        index = service.newIndexHtmlBuilder(dir,"Permalinks to latest files");
    }

    public void close() {
        index.close();
    }

    public void add(String localPath, String target) throws IOException {
        index.add(target, localPath);
    }
}
