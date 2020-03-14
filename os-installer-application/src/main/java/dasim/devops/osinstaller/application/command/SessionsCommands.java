package dasim.devops.osinstaller.application.command;

import org.springframework.shell.standard.ShellComponent;
import org.springframework.shell.standard.ShellMethod;

/**
 * Class for the session's shell command
 */
@ShellComponent
public class SessionsCommands {

    /**
     * Get all logs of your session
     *
     * @return information about process
     */
    @ShellMethod(group = "Sessions commands", value = "Get all logs of your session")
    public String log() {

        return "Trying to find the bullshit... ?";
    }
}
