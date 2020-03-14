package dasim.devops.osinstaller.application.command;

import org.springframework.shell.standard.ShellComponent;
import org.springframework.shell.standard.ShellMethod;

/**
 * Class for the application's shell command
 */
@ShellComponent
public class ApplicationsCommands {

    /**
     * Get the complete list of applications autorized to install no matter the template
     *
     * @return information about process
     */
    @ShellMethod(group = "Applications commands",
                 value = "Get the complete list of applications autorized to install no matter the template")
    public String list() {

        return "list of applications autorized !";
    }
}
