package dasim.devops.osinstaller.server;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * Main class
 */
@SpringBootApplication
public class OSInstallerServer {

    /**
     * allow to launch application
     *
     * @param args parameters of application
     */
    public static void main(String[] args) {

        SpringApplication.run(OSInstallerServer.class, args);
    }

}
