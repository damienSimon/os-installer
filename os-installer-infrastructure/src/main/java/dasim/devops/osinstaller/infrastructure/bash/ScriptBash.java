package dasim.devops.osinstaller.infrastructure.bash;

import java.io.IOException;

import org.springframework.stereotype.Component;

/**
 * Class to manage installation of an application by running th script which contains all bash commands
 */
@Component
public class ScriptBash {

    /**
     * Method which launch the script with all bash commands to install application
     *
     * @throws IOException exception if error occurs when bash commands execution
     */
    public void launch() throws IOException {

        String[] command = new String[]{"ping", "www.google.com"};
        Runtime.getRuntime()
                .exec(command);
    }
}
