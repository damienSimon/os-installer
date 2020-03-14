package dasim.devops.osinstaller.server;

import org.jline.utils.AttributedString;
import org.jline.utils.AttributedStyle;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.shell.jline.PromptProvider;

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

    @Bean
    public PromptProvider myPromptProvider() {

        return () -> new AttributedString("os-installer:> ", AttributedStyle.DEFAULT.foreground(AttributedStyle.RED));
    }

}
